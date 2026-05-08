module mux4i5w(    
    input [1:0] switch,
	 input [4:0] f_count,
	 input [4:0] t_count,
	 input [4:0] p_count,
	 input [4:0] l_count,
	 
	 output [4:0] out_count

);

mux4i1o mux_b4(
	.i0(f_count[4]),
	.i1(t_count[4]),
	.i2(p_count[4]),
	.i3(l_count[4]),
	.s1(switch[1]),
	.s0(switch[0]),
	.out(out_count[4])
);

mux4i1o mux_b3(
	.i0(f_count[3]),
	.i1(t_count[3]),
	.i2(p_count[3]),
	.i3(l_count[3]),
	.s1(switch[1]),
	.s0(switch[0]),
	.out(out_count[3])
);

mux4i1o mux_b2(
	.i0(f_count[2]),
	.i1(t_count[2]),
	.i2(p_count[2]),
	.i3(l_count[2]),
	.s1(switch[1]),
	.s0(switch[0]),
	.out(out_count[2])
);

mux4i1o mux_b1(
	.i0(f_count[1]),
	.i1(t_count[1]),
	.i2(p_count[1]),
	.i3(l_count[1]),
	.s1(switch[1]),
	.s0(switch[0]),
	.out(out_count[1])
);

mux4i1o mux_b0(
	.i0(f_count[0]),
	.i1(t_count[0]),
	.i2(p_count[0]),
	.i3(l_count[0]),
	.s1(switch[1]),
	.s0(switch[0]),
	.out(out_count[0])
);


endmodule