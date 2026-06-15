module instruction_decoder(
    input [31:0] instr,
    
    output  [4:0] a1,
    output  [4:0] a2,
    output  [4:0] a3,
    output  [6:0] opcode,
    output  [6:0] func7,
    output  [2:0] func3
);
//a1=rs1,a2=rs2,a3=rd

    assign a1=instr[19:15];
    assign a2=instr[24:20];
    assign a3=instr[11:7];
    assign opcode=instr[6:0];
    assign func3=instr[14:12];
    assign func7=instr[31:25];

endmodule
