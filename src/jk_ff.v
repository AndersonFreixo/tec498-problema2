module jk_ff (
    input clk, n_reset, j, k,
    output reg q,
	 output q_bar
);
	 not(q_bar, q);	 
	 
    always @(posedge clk or negedge n_reset) begin
        if (!n_reset) 
            q <= 1'b0;
        else begin
            case ({j, k})
                2'b00: q <= q;    // Hold
                2'b01: q <= 1'b0; // Reset
                2'b10: q <= 1'b1; // Set
                2'b11: q <= !q;   // Toggle
            endcase
        end
		end
endmodule