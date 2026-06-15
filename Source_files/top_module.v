module top_module(
    input clk,
    input rst,

    output [31:0] result,
    output [31:0] fib_value
);

wire [31:0] pc;
wire [31:0] pcnext;
wire [31:0] pctarget;
wire [31:0] pcplus4;

wire [31:0] instr;

wire [6:0] opcode;
wire [2:0] func3;
wire [6:0] func7;

wire [4:0] a1;
wire [4:0] a2;
wire [4:0] a3;

wire [31:0] rd1;
wire [31:0] rd2;

wire [31:0] immext;

wire pcsrc;
wire [1:0] resultsrc;
//wire branch;
wire memwrite;
wire [5:0] alucntrl;
wire alusrc;
wire [2:0] immsrc;
wire regwrite;
//wire [2:0] aluop;
wire memtoreg;
wire memread;
wire jump;
wire branch;

wire [31:0] b;
wire [31:0] aluresult;

wire zero;

//wire wd;

wire [31:0] rd;



program_counter pc_reg(
    .pc(pc),
    .pcnext(pcnext),
    .clk(clk),
    .rst(rst)
);

pcmux pc_mux(
    .pcsrc(pcsrc),
    .pctarget(pctarget),
    .pcplus4(pcplus4),
    .pcnext(pcnext)
);

pcplus4 pc_plus4(
    .pc(pc),
    .pcplus4(pcplus4)
);


pctarget pct(
    .pc(pc),
    .immext(immext),
    .pctarget(pctarget)
);

instruction_memory instrmem(
    .addr(pc),
    .rd(instr)
);

instruction_decoder id(
    .instr(instr),

    .opcode(opcode),
    .func3(func3),
    .func7(func7),

    .a1(a1),
    .a2(a2),
    .a3(a3)
);

registerfile rf(
     .a1(a1),
     .a2(a2),
     .a3(a3),
     .clk(clk),
     .we3(regwrite),
     .rd1(rd1),
     .rd2(rd2),
     .wd3(result)
);

assign fib_value = rf.rf[1];

immediate_extender immex(
    .instr(instr),
    .immext(immext),
    .immsrc(immsrc)
);

controlunit control_unit(
    .opcode(opcode),
    .func3(func3),
    .func7(func7),
    .zero(zero),

    .pcsrc(pcsrc),
    .resultsrc(resultsrc),
    .memwrite(memwrite),
    .alucntrl(alucntrl),
    .alusrc(alusrc),
    .immsrc(immsrc),
    .regwrite(regwrite),
    .memread(memread),
    .memtoreg(memtoreg),
    .jump(jump)
);

alu_mux alumux(
    .rd2(rd2),
    .immext(immext),
    .alusrc(alusrc),
    .b(b)
);

alu alu(
    .a(rd1),
    .b(b),
    .alucntrl(alucntrl),
    .aluresult(aluresult),
    .zero(zero)
);

data_memory dm(
    .clk(clk),
    .we(memwrite),
    .a(aluresult),
    .wd(rd2),
    .rd(rd)
);

resultmux result_mux(
    .aluresult(aluresult),
    .rd(rd),
    .immext(immext),
    .pcplus4(pcplus4),
    .resultsrc(resultsrc),
    .result(result)
);

endmodule







