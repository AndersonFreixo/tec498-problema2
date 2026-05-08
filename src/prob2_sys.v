module prob2_sys(    
    input f_in, t_in, p_in, l_in, m1_in, m0_in, fpga_clk,
	 input reset, //reset global dos contadores
    output d0a_out, d0b_out, d0c_out, d0d_out, d0e_out, d0f_out, d0g_out, led3, led2, led1, led0, of_led,
	 output[6:0] dezenas_display, //a = [0], ... g = [6]
	 output[6:0] unidades_display,
	 output[6:0] letra_sensor_display	 
);

wire f_limit, t_limit, p_limit, l_limit, global_limit; 				//indicam overflow dos contadores
wire [4:0] f_count;  			//valor dos contadores
wire  [4:0] t_count; 
wire [4:0] p_count; 
wire [4:0] l_count;  
wire not_limit; 					//se = 1, nao aconteceu overflow
wire sys_clk;        			//clock de 2 segundos, saida do divisor de frequencia
wire [1:0] switch_painel; 		//define que variavel vai ser mostrada no painel, muda de 2 em 2 segundos
wire [4:0] count_painel; 		//numero de 5 bits a ser mostrado no painel
wire [3:0] dezenas;      		//numero de 4 bits contendo o valor da dezena do contador a ser mostrado
wire [3:0] unidades;     		//idem com unidades
wire [1:0] who_overflow; 		//quem estourou o counter?
wire [1:0] show_painel;			//quem mostrar no painel?
or (global_limit, f_limit, t_limit, p_limit, l_limit); //1 se o limite de qualquer contador for 1

not(not_limit, global_limit); //Pra ser usado no mecanismo de trava.

and(of_led, global_limit, switch_painel[1]); //led de overflow que pisca de 2 em 2 segundos
/*Os fios do display e leds do problema 1 nao podem
ir direto p a saida porque e preciso apaga-los caso
haja estouro de contador*/

//fios da saida para o display do problema 1
wire d0a, d0b, d0c, d0d, d0e, d0f, d0g; 	
//fios da saida de led do problema 1
wire l3, l2, l1, l0; 
wire n_reset;
not(n_reset, reset);
/*Cada segmento 'apaga' quando recebe 1,
entao, usando OR, quando o limite tiver sido
atingido, todos os segmentos apagam.*/

or (d0a_out, d0a, global_limit); 
or (d0b_out, d0b, global_limit); 
or (d0c_out, d0c, global_limit); 
or (d0d_out, d0d, global_limit); 
or (d0e_out, d0e, global_limit); 
or (d0f_out, d0f, global_limit); 
or (d0g_out, d0g, global_limit); 

/*Como 1 manda os leds acenderem, 
e nao apagarem, como no display,
entao temos que usar AND c/ limit negado*/

and (led0, l0, not_limit);
and (led1, l1, not_limit);
and (led2, l2, not_limit);
and (led3, l3, not_limit);

/*O sistema tambem deve travar
o sinal de entrada quando um
contador estoura*/
wire fset, tset, pset, lset;
and (fset, f_in, not_limit);
and (tset, t_in, not_limit);

/*l e p tem logica negativa, entao
quando o global_limit = 1,  pset e lset 
vao enviar sempre 1*/
or (pset, p_in, global_limit);
or (lset, l_in, global_limit);


//Instanciacao de todo o circuito do problema 1
main prob1_sys (
	. f_in (fset),
	. t_in (tset),
	. p_in (pset),
	. l_in (lset),
	. m1_in (m1_in),
	. m0_in (m0_in),	
	.a (d0a), 
	.b (d0b), 
	.c (d0c), 
	.d (d0d), 
	.e (d0e), 
	.f (d0f), 
	.g (d0g), 
	.led3 (l3), 
	.led2 (l2), 
	.led1 (l1), 
	.led0 (l0) 				
);

//Divisor de frequencia modulo 100000000 (c/ 50.000MHz, tem 1/2Hz) 
divfreq50m divisor(    
    . clk(fpga_clk), 
    . pulse(sys_clk)
);

/*Agora comeca a emocao! =D*/
/*O clock dos contadores eh o proprio sinal de entrada. 
limit indica se estourou o counter*/
//Contadores para cada sensor
count5bit f_counter(
	. clk (fpga_clk),
	. trigger (fset),
	. reset (n_reset),
	. count (f_count),
	. limit (f_limit)
);

count5bit t_counter(
	. clk (fpga_clk),
	. trigger (tset),
	. reset (n_reset),
	. count (t_count),
	. limit (t_limit)
);

/*Infelizmente nao deu tempo de fazer o flipflop
com logica apropriada pra os sensores p e l :( */
wire notpset, notlset;
not (notpset, pset);
not (notlset, lset);

count5bit p_counter(
   . clk (fpga_clk),
	. trigger (notpset),
	. reset (n_reset),
	. count (p_count),
	. limit (p_limit)
);

count5bit l_counter(
	. clk (fpga_clk),
	. trigger (notlset),
	. reset (n_reset),
	. count (l_count),
	. limit (l_limit)
);


//Muda o valor de dois em dois segundos e manda o valor como chave pro mux
count2bit clock_painel(
	. clk(sys_clk),
	. count(switch_painel)
);

//Define o valor a ser mostrado no painel	
mux4i5w mux_contador(
	. f_count(f_count),
	. t_count(t_count),
	. p_count(p_count),
	. l_count(l_count),	
	. switch(show_painel),    //eh a vez de quem ser mostrado?
	. out_count(count_painel) //qual a contagem?
);

//Codificacao de show_painel e who_overflow
//F	00
//T	01
//P	10
//L	11

//Codificador do codigo do sensor a ser mostrado para letra 7 segmentos
sensor2disp display_letra_sensor(
	.l (show_painel), //entrada - codigo referente ao sensor 
   .segs (letra_sensor_display) //saida - segmentos display
);

//Identificador do contador que deu overflow
conv_who_overflow who_of(
	.counters ({f_limit, t_limit, p_limit, l_limit}),
	.who (who_overflow)	//saida seguindo mesmo codigo de show_painel
);

//Eh pra mostrar os sensores intercalados normalmente, ou o que deu overflow?
mux2i2w show_what_mux(
	. normal (switch_painel),
	. overflow (who_overflow),
	. s (global_limit),
	. switch_show (show_painel)
);

//Codificador BCD, recebe um valor de 5 bits
//e tem duas saidas de 4 bits, um para cada digito
//(decimal e unidade)
bin2bcd codificador_bcd(
	. n (count_painel),
	. tens(dezenas),
	. units (unidades)
);

//Codificador do BCD (dezenas) pra display 7 segmentos
//(reciclado do problema 1)
sensor2bin display_dezenas(
	.F(dezenas[3]),
	.T(dezenas[2]),
	.P(dezenas[1]),
	.L(dezenas[0]),
	.a_out(dezenas_display[0]),
	.b_out(dezenas_display[1]),
	.c_out(dezenas_display[2]),
	.d_out(dezenas_display[3]),
	.e_out(dezenas_display[4]),
	.f_out(dezenas_display[5]),
	.g_out(dezenas_display[6])
);

//Codificador do BCD (unidades) pra display 7 segmentos
//(reciclado do problema 1)
sensor2bin display_unidades(
	.F(unidades[3]),
	.T(unidades[2]),
	.P(unidades[1]),
	.L(unidades[0]),
	.a_out(unidades_display[0]),
	.b_out(unidades_display[1]),
	.c_out(unidades_display[2]),
	.d_out(unidades_display[3]),
	.e_out(unidades_display[4]),
	.f_out(unidades_display[5]),
	.g_out(unidades_display[6])
);
	
endmodule