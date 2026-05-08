module sensor2disp(    
    input [1:0] l,  //letra
    output [6:0] segs //segmentos
	);
	
//F = 00
//T = 01
//P = 10
//L = 11
	
wire NotL1, NotL0;
wire L1L0, NotL1NotL0, L0XnorL1, L1NotL0, NotL1L0;

not (NotL1, l[1]);
not (NotL0, l[0]);

and (L1L0, l[1],l[0]);
and (NotL1NotL0, NotL1, NotL0);
xnor(L0XnorL1, l[0], l[1]);
and (L1NotL0, l[1], NotL0);
and (NotL1L0, NotL1, l[0]);

or(segs[0], L1L0); //a
or(segs[1], L0XnorL1); //b
or(segs[2], 1'b1, 1'b1); //c -> sempre apaga
or(segs[3], NotL0); //d
or(segs[4], NotL1L0); //e
or(segs[5], 1'b0, 1'b0); //f -> nunca apaga
or(segs[6], l[0]); //g
	
endmodule