module main_decoder_tb;
reg [6:0] opcode;
wire branch,
     memwrite,
     alusrc,
     jump,
     memread,
     memtoreg;
wire [1:0] resultsrc;
wire [2:0] immsrc,aluop;

main_decoder dut(
    .opcode(opcode),

    .branch(branch),
    .resultsrc(resultsrc),
    .memwrite(memwrite),
    .alusrc(alusrc),
    .immsrc(immsrc),
    .regwrite(regwrite),
    .aluop(aluop),
    .jump(jump),
    .memread(memread),
    .memtoreg(memtoreg)
);
initial
begin
    $dumpfile("main_decoder.vcd");
    $dumpvars(0,main_decoder_tb);
    $monitor($time,"  opcode=%b branch=%b resultsrc=%b memwrite=%b alusrc=%b immsrc=%b regwrite=%b aluop=%b jump=%b memread=%b memtoreg=%b",
              opcode,branch,resultsrc,memwrite,alusrc,immsrc,regwrite,aluop,jump,memread,memtoreg);

   // R-type
    opcode = 7'b0110011;
    #10;


    // I-type
    opcode = 7'b0010011;
    #10;


    // Load
    opcode = 7'b0000011;
    #10;


    // Store
    opcode = 7'b0100011;
    #10;


    // Branch
    opcode = 7'b1100011;
    #10;


    // JAL
    opcode = 7'b1101111;
    #10;


    // LUI
    opcode = 7'b0110111;
    #10;


    // Invalid opcode
    opcode = 7'b1111111;
    #10;

    $finish;

end
endmodule
               
