module RISC (
    input clk,rst,
    output halt
);

wire zero,data_e,ld_ac,ld_ir,wr,rd,ld_pc,inc_pc,sel;
wire [2:0] opcode,phase;
wire [4:0] addr,pc_addr,ir_addr;
wire [7:0] ac_out,data,alu_out;

// Controller
controller Controller(.opcode(opcode),.phase(phase),.zero(zero),
.sel(sel),.rd(rd),.ld_ir(ld_ir),.inc_pc(inc_pc),.halt(W_halt),
.ld_pc(ld_pc),.data_e(data_e),.ld_ac(ld_ac),.wr(wr));
assign halt=W_halt;
// ALU
alu #(.WIDTH(8)) ALU (.opcode(opcode),.in_a(ac_out),
.in_b(data),.a_is_zero(zero),.alu_out(alu_out));

// Driver
driver#(.WIDTH(8)) Driver (.data_en(data_e),.data_in(alu_out),
.data_out(data));

//Register_ac
register #(.WIDTH(8))Register_ac (.data_in(alu_out),.load(ld_ac),
.clk(clk),.rst(rst),.data_out(ac_out));

//Register_ir
register #(.WIDTH(8))Register_ir (.data_in(data),.load(ld_ir),
.clk(clk),.rst(rst),.data_out({ir_addr,opcode}));//switch opcode,ir_addr

//Memory
memory #(.AWIDTH(5),.DWIDTH(8),.DEPTH(32))memory_inst(.addr(addr),
.clk(clk),.wr(wr),.rd(rd),.data(data));

//Counter_pc
counter #(.WIDTH(5))Counter_pc(.cnt_in(ir_addr),
.cnt_out(pc_addr),.enab(inc_pc),.load(ld_pc),
.clk(clk),.rst(rst));

//multiplexor_add
multiplexor #(.WIDTH(5))multiplexor_add(.in0(ir_addr),
.in1(pc_addr),.mux_out(addr),.sel(sel));

//Counter_phase
counter #(.WIDTH(3))Counter_phase(.cnt_in(3'b000),
.cnt_out(phase),.enab(1'b1),.load(1'b0),
.clk(clk),.rst(rst));

endmodule
