module controlunit_tb;

reg  [6:0] opcode;
reg  [6:0] func7;
reg  [2:0] func3;
reg        zero;

wire       pcsrc;
wire [1:0] resultsrc;
wire       memwrite;
wire [5:0] alucntrl;
wire [2:0] immsrc;
wire       alusrc;
wire       regwrite;
wire       memread;
wire       memtoreg;
wire       jump;

controlunit dut(
    .opcode(opcode),
    .func7(func7),
    .func3(func3),
    .zero(zero),

    .pcsrc(pcsrc),
    .resultsrc(resultsrc),
    .memwrite(memwrite),
    .alucntrl(alucntrl),
    .immsrc(immsrc),
    .alusrc(alusrc),
    .regwrite(regwrite),
    .memread(memread),
    .memtoreg(memtoreg),
    .jump(jump)
);

initial
begin
    $monitor($time,"  opcode=%b  func3=%b  func7=%b  alucntrl=%d   pcsrc=%b",
                       opcode,func3,func7,alucntrl,pcsrc);
//load
opcode = 7'b0000011;
    func3  = 3'b010;
    #10;

//store
opcode = 7'b0100011;
#10;

//BEQ
opcode = 7'b1100011;
    func3  = 3'b000;
    zero   = 1;
    #10;

    // BNE
    func3  = 3'b001;
    zero   = 0;
    #10;

//I 
//ADDI
opcode = 7'b0010011;
    func3  = 3'b000;
    #10;

    // ANDI
    func3  = 3'b111;
    #10;

    // ORI
    func3  = 3'b110;
    #10;

    $finish;
end
endmodule