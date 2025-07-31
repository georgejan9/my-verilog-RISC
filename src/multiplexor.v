module multiplexor #(parameter integer WIDTH=5)(
    input [WIDTH-1:0] in0,in1,
    output [WIDTH-1:0] mux_out,
    input sel
);
assign mux_out=(sel==0)?in0:in1;

endmodule