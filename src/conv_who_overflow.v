module conv_who_overflow(    
    input [3:0] counters,  //valor de estouro dos counters
    output [1:0] who   //quem estourou
	);
	
//counters[3:0] = FL TL PL LL
or (who[1], counters[1], counters[0]);
or (who[0], counters[2], counters[0]);

endmodule