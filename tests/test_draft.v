`define eval(input, output, value) \
		$write("in=%4b out=%b \n", input, output);\
        if (output !== value) begin \
            $display("ERROR: output != value"); \
        end

module test_testbench();
	reg [3:0] bus;
	wire out_a;
    simple_test t (
        .A (bus[3]),
        .B (bus[2]),
        .C (bus[1]),
        .D (bus[0]),
        .val (out_a)
    );
    initial begin
    	bus[3:0] = 4'b0000;
		#100
		`eval(bus, out_a, 0);
    	bus[3:0] = 4'b0001;
		#100
		`eval(bus, out_a, 1);
	    bus[3:0] = 4'b0010;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b0011;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b0100;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b0101;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b0110;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b0111;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);		   
    	bus[3:0] = 4'b1000;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);
    	bus[3:0] = 4'b1001;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b1010;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b1011;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b1100;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b1101;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b1110;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	
	    bus[3:0] = 4'b1111;
		#100
	    $write("in=%4b out=%b \n", bus, out_a);	

    end 
         
endmodule
