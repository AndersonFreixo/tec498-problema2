module slowclock(    
    input clk,
    output pulse
);

wire [19:0] count;
wire [19:0] bar;
wire n_reset;
not (n_reset, pulse);


jk_ff ff00 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),	
	. clk(clk),	
	. q(count[0]),
	. q_bar(bar[0])
);

jk_ff ff01 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[0]),	
	. q(count[1]),
	. q_bar(bar[1])
);


jk_ff ff02 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[1]),	
	. q(count[2]),
	. q_bar(bar[2])
);


jk_ff ff03 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[2]),	
	. q(count[3]),
	. q_bar(bar[3])
);


jk_ff ff04 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[3]),	
	. q(count[4]),
	. q_bar(bar[4])
);


jk_ff ff05 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[4]),	
	. q(count[5]),
	. q_bar(bar[5])
);


jk_ff ff06 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[5]),	
	. q(count[6]),
	. q_bar(bar[6])
);


jk_ff ff07 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[6]),	
	. q(count[7]),
	. q_bar(bar[7])
);


jk_ff ff08 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[7]),	
	. q(count[8]),
	. q_bar(bar[8])
);


jk_ff ff09 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[8]),	
	. q(count[9]),
	. q_bar(bar[9])
);


jk_ff ff10 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[9]),	
	. q(count[10]),
	. q_bar(bar[10])
);


jk_ff ff11 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[10]),	
	. q(count[11]),
	. q_bar(bar[11])
);


jk_ff ff12 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[11]),	
	. q(count[12]),
	. q_bar(bar[12])
);


jk_ff ff13 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[12]),	
	. q(count[13]),
	. q_bar(bar[13])
);


jk_ff ff14 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[13]),	
	. q(count[14]),
	. q_bar(bar[14])
);


jk_ff ff15 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[14]),	
	. q(count[15]),
	. q_bar(bar[15])
);


jk_ff ff16 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[15]),	
	. q(count[16]),
	. q_bar(bar[16])
);


jk_ff ff17 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[16]),	
	. q(count[17]),
	. q_bar(bar[17])
);


jk_ff ff18 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[17]),	
	. q(count[18]),
	. q_bar(bar[18])
);


jk_ff ff19 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[18]),	
	. q(count[19]),
	. q_bar(bar[19])
);

and(pulse, count[0],count[1],count[2], count[3], count[4],count[5],count[6], count[7],count[8],count[9],count[10],count[11], count[12], count[13],count[14],count[15],count[16], count[17],count[18],count[19]);

endmodule