module register #(parameter WIDTH=8) (
    input [WIDTH-1:0] data_in,
    input load,clk,rst,
    output reg [WIDTH-1:0] data_out
);
always @ (posedge clk)
begin
    if (rst==1'b1)
        data_out<=0;
    else if (load==1'b1)
        data_out<=data_in;
    else 
        data_out<=0;    
end
endmodule
