module imm_ext_tb;
reg [31:0] instr;
reg [2:0] immsrc;
wire [31:0] immext;

immediate_extender dut(.instr(instr),.immext(immext),.immsrc(immsrc));

initial 
begin
    $monitor($time," immsrc=%b  instr=%h  immext=%h",immsrc,instr,immext);

    // I-TYPE
    // addi x1,x2,10
    // imm = 10
    instr  = 32'b000000001010_00010_000_00001_0010011;
    immsrc = 3'b000;

    #10;
    
    // S-TYPE
    // sw x1,8(x2)
    // imm = 8
    instr  = 32'b0000000_00001_00010_010_01000_0100011;
    immsrc = 3'b001;

    #10;

    // B-TYPE
    // beq x1,x2,16
    // imm = 16
     instr  = 32'b0000000_00010_00001_000_10000_1100011;
    immsrc = 3'b010;

    #10;

    // U-TYPE
    // lui x5,0x12345
     instr  = 32'h123452B7;
    immsrc = 3'b011;

    #10;

     // NEGATIVE I-TYPE IMM
    // addi x1,x2,-1
    instr  = 32'b111111111111_00010_000_00001_0010011;
    immsrc = 3'b000;

    #10; $finish;
end
endmodule
    


