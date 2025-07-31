module controller(
    input [2:0]opcode,phase,
    input zero,
    output reg sel,rd,ld_ir,inc_pc,halt,ld_pc,data_e,ld_ac,wr 
  );
reg ALUOP,HALT;
always @ (*)
begin

    if (opcode==3'b010 || opcode==3'b011 || opcode==3'b100 || opcode==3'b101)
        ALUOP=1;
    else
        ALUOP=0;

    if (opcode ==3'b000 )
        HALT=1'b1;
end
always @(*)
begin
    case (phase)
        3'd0:
                begin
                    sel=1'b1;
                    rd=1'b0;
                    ld_ir=1'b0;
                    halt=1'b0;
                    inc_pc=1'b0;
                    ld_ac=1'b0;
                    ld_pc=1'b0;
                    wr=1'b0; 
                    data_e=1'b0;
                end
        3'd1:
                begin
                    sel=1'b1;
                    rd=1'b1;
                    ld_ir=1'b0;
                    halt=1'b0;
                    inc_pc=1'b0;
                    ld_ac=1'b0;
                    ld_pc=1'b0;
                    wr=1'b0; 
                    data_e=1'b0;
                end
        3'd2:
                begin
                    sel=1'b1;
                    rd=1'b1;
                    ld_ir=1'b1;
                    halt=1'b0;
                    inc_pc=1'b0;
                    ld_ac=1'b0;
                    ld_pc=1'b0;
                    wr=1'b0; 
                    data_e=1'b0;
                end
        3'd3:
                begin
                    sel=1'b1;
                    rd=1'b1;
                    ld_ir=1'b1;
                    halt=1'b0;
                    inc_pc=1'b0;
                    ld_ac=1'b0;
                    ld_pc=1'b0;
                    wr=1'b0; 
                    data_e=1'b0;
                end
        3'd4:
                begin
                    sel=1'b0;
                    rd=1'b0;
                    ld_ir=1'b0;
                    halt=HALT;
                    inc_pc=1'b1;
                    ld_ac=1'b0;
                    ld_pc=1'b0;
                    wr=1'b0; 
                    data_e=1'b0;
                end
        3'd5:
                begin
                    sel=1'b0;
                    rd=ALUOP;
                    ld_ir=1'b0;
                    halt=1'b0;
                    inc_pc=1'b0;
                    ld_ac=1'b0;
                    ld_pc=1'b0;
                    wr=1'b0; 
                    data_e=1'b0;
                end        
        3'd6:
                begin
                    sel=1'b0;
                    rd=ALUOP;
                    ld_ir=1'b0;
                    halt=1'b0;
                        if (opcode ==3'b001 && zero)
                            inc_pc=1'b1;
                        else
                            inc_pc=1'b0;
                    ld_ac=1'b0;
                    //JMP
                        if (opcode ==3'b111)
                            ld_pc=1'b1;
                        else
                            ld_pc=1'b0;
                    wr=1'b0; 
                        if (opcode ==3'b110)
                            data_e=1'b1;
                        else
                            data_e=1'b0;
                end 
        3'd7:
                begin
                    sel=1'b0;
                    rd=ALUOP;
                    ld_ir=1'b0;
                    halt=1'b0;
                    inc_pc=1'b0;
                    ld_ac=ALUOP;
                    ld_pc=&opcode;
                    wr=opcode[2]&opcode[1]&(~opcode[0]); 
                    data_e=opcode[2]&opcode[1]&(~opcode[0]); 
                end 
    endcase
end

endmodule
