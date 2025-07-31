module driver_tb ();

reg data_en;
reg [7:0] data_in;
wire[7:0] data_out ;
driver#(.WIDTH(8))DUT(.data_en(data_en),.data_in(data_in),.data_out(data_out) );
integer x;
initial begin

		data_in=8'b0000_0001;
		data_en=1;
		#10;
		if(data_out != data_in)
			begin
				$display("Error");
				$stop;
			end
		data_in=8'b0000_0110;
		data_en=1;
		#10;
		if(data_out != data_in)
			begin
				$display("Error");
				$stop;
			end
		data_in=8'b1110_0001;
		data_en=0;
		#10;
		if(data_out != 8'bzzzz_zzzz)
			begin
				$display("Error");
				$stop;
			end
		$display("test passed");
		$stop;
end
initial
	$monitor("data_en=%b,data_in=%b,data_out=%b",data_en,data_in,data_out);
endmodule 
