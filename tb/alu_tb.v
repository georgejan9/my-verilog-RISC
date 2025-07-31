module alu_tb ();

    reg [2:0]opcode;
    reg [7:0] in_a,in_b;
    wire a_is_zero;
    wire [7:0]alu_out;
alu #(.WIDTH(8)) DUT(
    .opcode(opcode),
    .in_a(in_a),.in_b(in_b),
    .a_is_zero(a_is_zero),
    .alu_out (alu_out)
   );
integer i;
initial begin

for (i=0;i<1000;i=i+1)
begin
   		opcode=$random;
    		in_a=$random;
		in_b=$random;
		#10;
    case (opcode)
        3'b000:begin
		if(alu_out != in_a)
			begin
				$display("Error");
				$stop;
			end
end
        3'b001:begin
		if(alu_out != in_a)
			begin
				$display("Error");
				$stop;
			end
end
        3'b010:begin
		if(alu_out != (in_a+in_b))
			begin
				$display("Error");
				$stop;
			end
end
        3'b011:begin
		if(alu_out != (in_a & in_b))
			begin
				$display("Error");
				$stop;
			end
end
        3'b100:begin
		if(alu_out != (in_a ^ in_b))
			begin
				$display("Error");
				$stop;
			end
end
        3'b101:begin
		if(alu_out != in_b)
			begin
				$display("Error");
				$stop;
			end
end
        3'b110:begin
		if(alu_out != in_a)
			begin
				$display("Error");
				$stop;
			end
end
        3'b111:begin
		if(alu_out != in_a)
			begin
				$display("Error");
				$stop;
			end
end
    endcase

end
		$display("test passed");
		$stop;
end
initial
	$monitor("in_a=%b,in_b=%b,opcode=%b,a_is_zero=%b,alu_out=%b",in_a,in_b,opcode,a_is_zero,alu_out);
endmodule 
