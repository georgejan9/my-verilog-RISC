module register_tb ();
    reg [7:0] data_in;
    reg load,clk,rst;
    wire [7:0] data_out;
register #(.WIDTH(8)) DUT (.data_in(data_in),.load(load),.clk(clk),.rst(rst),.data_out(data_out));
initial
begin
clk = 1'b0;
forever
#10 clk=~clk;
end
initial 
begin
    rst=1'b1;
    #100;
    rst=1'b0;
    #50;
    load=1'b1;
    data_in=8'b1100_1110;
    #50;
end
endmodule
