module instr_decode_tb;
reg [31:0] instr;
wire [4:0] a1,a2,a3;
wire [6:0] opcode,func7;
wire [2:0] func3;

instruction_decoder dut(.instr(instr),.a1(a1),.a2(a2),.a3(a3),.opcode(opcode),.func3(func3),.func7(func7));
initial 
begin
    $monitor($time,"  instr=%h opcode=%b rs1=%d rs2=%d rd=%d func3=%b func7=%b",instr,opcode,a1,a2,a3,func3,func7);

    // add x5,x1,x2
    instr = 32'b0000000_00010_00001_000_00101_0110011;
    #10;

    // sub x6,x3,x4
    instr = 32'b0100000_00100_00011_000_00110_0110011;
    #10;

    $finish;
end
endmodule
