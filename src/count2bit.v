module count2bit(    
    input clk,	
    output [1:0] count
);

wire bar;
wire reset, n_reset;
not (n_reset, reset);

jk_ff ff0 (
	. j (1'b1),
	. k (1'b1),
	. clk(clk),	
	. n_reset(n_reset),	
	. q(count[0]),
	. q_bar(bar)	
);

jk_ff ff1 (
	. j (1'b1),
	. k (1'b1),
	. clk(bar),	
	. n_reset(n_reset),	
	. q(count[1])
);

and(reset, count[1], count[0], bar);

endmodule