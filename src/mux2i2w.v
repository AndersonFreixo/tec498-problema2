module mux2i2w(    
    input s, 
    input [1:0] normal,
	 input [1:0] overflow,
	 output [1:0] switch_show
);

mux2i1w mux0 (
	. i0(normal[0]),
	. i1(overflow[0]),
	. s(s),
	. out(switch_show[0])
);

mux2i1w mux1 (
	. i0(normal[1]),
	. i1(overflow[1]),
	. s(s),
	. out(switch_show[1])
);

endmodule