module mux2i1w(    
    input i0, i1, s, 					            
    output  out  
);

wire out0, out1;
wire Nots;

not (Nots, s);

and (out0, i0, Nots);
and (out1, i1, s);
 
or (out, out0, out1);  
endmodule