module controller_tb ();
    reg[2:0]opcode,phase;
    reg zero;
    wire sel,rd,ld_ir,inc_pc,halt,ld_pc,data_e,ld_ac,wr;
controller DUT(.opcode(opcode),.phase(phase),.zero(zero),.sel(sel),.rd(rd),.ld_ir(ld_ir),.inc_pc(inc_pc),.halt(halt),.ld_pc(ld_pc),.data_e(data_e),.ld_ac(ld_ac),.wr(wr) );
integer i;
initial 
begin
	for(i=0;i<1000;i=i+1)
	begin
    		opcode=$random;
		phase=$random;
    		zero=$random;
		#10;
	end
end
initial 
	$monitor ("opcode=%b,phase=%b,zero=%b,sel=%b,rd=%b,ld_ir=%b,inc_pc=%b,halt=%b,ld_pc=%b,data_e=%b,ld_ac=%b,wr=%b",opcode,phase,zero,sel,rd,ld_ir,inc_pc,halt,ld_pc,data_e,ld_ac,wr);

endmodule
