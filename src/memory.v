module memory #(parameter AWIDTH=5,DWIDTH=8,DEPTH=32)(
    input [AWIDTH-1:0] addr,
    input clk,wr,rd,
    inout [DWIDTH-1:0] data
);
reg [DWIDTH-1:0] array [DEPTH-1:0];
assign data=(rd==1'b1)?array[addr]:0;
always @ (posedge clk)
begin
    if (wr==1'b1)
        array[addr]=data;
end
endmodule
