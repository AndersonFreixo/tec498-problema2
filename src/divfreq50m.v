module divfreq50m(    
    input clk, 
    output pulse
);

wire [26:0] count;
wire [26:0] bar;
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


jk_ff ff20 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[19]),	
	. q(count[20]),
	. q_bar(bar[20])
);


jk_ff ff21 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[20]),	
	. q(count[21]),
	. q_bar(bar[21])
);


jk_ff ff22 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[21]),	
	. q(count[22]),
	. q_bar(bar[22])
);


jk_ff ff23 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[22]),	
	. q(count[23]),
	. q_bar(bar[23])
);


jk_ff ff24 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[23]),	
	. q(count[24]),
	. q_bar(bar[24])
);


jk_ff ff25 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[24]),	
	. q(count[25]),
	. q_bar(bar[25])
);


jk_ff ff26 (
	. j (1'b1),
	. k (1'b1),
	. n_reset(n_reset),		
	. clk(bar[25]),	
	. q(count[26]),
	. q_bar(bar[26])
);


//Reset em b101111101011110000100000000 (100.000.000, 100 milhoes)
and(pulse, count[8],count[13],count[14],count[15],count[16],count[18],count[20],count[21],count[22],count[23],count[24],count[26]);

endmodule
