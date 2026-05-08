module count5bit(    
    input trigger, reset, clk,
    output [4:0] count,
    output limit  
);


wire [4:0] bar;
wire n_reset, trigger2;
not (n_reset, reset);

debouncer deb (
    . clk (clk),           // System clock
    . rst_n (n_reset),     // Raw button input (noisy)
    . button_in (trigger),
	 . button_out (trigger2) // Debounced button output
);

jk_ff ff0 (
	. j (1'b1),
	. k (1'b1),
	. clk(trigger2),	
	. n_reset(n_reset),	
	. q(count[0]),
	. q_bar(bar[0])
);

jk_ff ff1 (
	. j (1'b1),
	. k (1'b1),
	. clk(bar[0]),	
	. n_reset(n_reset),	
	. q(count[1]),
	. q_bar(bar[1])
);

jk_ff ff2 (
	. j (1'b1),
	. k (1'b1),
	. clk(bar[1]),
	. n_reset(n_reset),	
	. q(count[2]),
	. q_bar(bar[2])
);


jk_ff ff3 (
	. j (1'b1),
	. k (1'b1),
	. clk(bar[2]),	
	. n_reset(n_reset),	
	. q(count[3]),
	. q_bar(bar[3])
);

jk_ff ff4 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),	
	. clk(bar[3]),	
	. q(count[4]),
	. q_bar(bar[4])
);

and(limit, count[4], count[2], count[0]);

endmodule