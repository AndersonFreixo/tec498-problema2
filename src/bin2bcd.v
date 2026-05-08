/*Converte a entrada de 5 bits do contador 
em dois decimais BCD, sendo o digito das dezenas apenas de 0 a 2*/

module bin2bcd(    
    input [4:0] n, 
    output [3:0] tens, 
	 output [3:0] units
);

wire NotN4, NotN3, NotN2, NotN1;
wire N4andNotN2, N3andN2, N3andN1, N2andN1;
wire N4andN1, N3andNotN2andNotN1;
wire NotN4andNotN3, NotN4andNotN3andN2, NotN4andNotN3andN1;
wire N4andNotN2andNotN1;
wire N3andN2andNotN1;

not(NotN1, n[1]);
not(NotN2, n[2]);
not(NotN3, n[3]);
not(NotN4, n[4]);

and (N4andNotN2, n[4], NotN2);
and (N2andN1, n[3], n[1]);
and (N3andN2, n[3], n[2]);
and (N3andN1, n[3], n[1]);
and (N4andN1, n[4], n[1]);
and (N3andNotN2andNotN1, n[3], NotN2, NotN1);

and (NotN4andNotN3, NotN4, NotN3);
and (NotN4andNotN3andN2, NotN4andNotN3, n[2]);
and (NotN4andNotN3andN1, NotN4andNotN3, n[1]);
and (N4andNotN2andNotN1, N4andNotN2, NotN1);
and (N3andN2andNotN1, N3andN2, NotN1);


/*dezenas*/
and (tens[3], 1'b1, 1'b0);  //Os 2 bits maiores das dezenas sao sempre 0
and (tens[2], 1'b1, 1'b0);
and (tens[1], n[4], n[2]);
or (tens[0], N4andNotN2, N3andN2, N3andN1);

/*unidades*/
or (units[3], N4andN1, N3andNotN2andNotN1);
or (units[2], NotN4andNotN3andN2, N4andNotN2andNotN1, N2andN1);
or (units[1], NotN4andNotN3andN1, N4andNotN2andNotN1, N3andN2andNotN1);
and (units[0], 1'b1, n[0]);

endmodule