module counter #(parameter WIDTH=5)(
    input [WIDTH-1:0] cnt_in,
    output reg[WIDTH-1:0] cnt_out,
    input enab,load,clk,rst
);

always @ (posedge clk )
begin
    if(rst==1'b1)
        cnt_out<=0;
    else 
    begin
    if (enab==1'b1)
    begin
    if(load==1'b1)
        cnt_out<=cnt_in;
    else
        cnt_out<=cnt_out+1'b1;
    end
    end
end
endmodule
