
module instruction_memory_tb;

reg [31:0] addr;

wire [31:0] rd;

// ==========================
// Instantiate DUT
// ==========================

instruction_memory dut(
    .addr(addr),
    .rd(rd)
);

// ==========================
// Dump File
// ==========================

initial begin
    $dumpfile("instruction_memory_tb.vcd");
    $dumpvars(0, instruction_memory_tb);
end

// ==========================
// Test
// ==========================

initial begin

$display("==============================================");
$display(" TESTING INSTRUCTION MEMORY ");
$display("==============================================");

// Instruction 0
addr = 32'd0;
#10;
$display("ADDR = %d | INSTRUCTION = %h", addr, rd);

// Instruction 1
addr = 32'd4;
#10;
$display("ADDR = %d | INSTRUCTION = %h", addr, rd);

// Instruction 2
addr = 32'd8;
#10;
$display("ADDR = %d | INSTRUCTION = %h", addr, rd);

// Instruction 3
addr = 32'd12;
#10;
$display("ADDR = %d | INSTRUCTION = %h", addr, rd);

// Instruction 4
addr = 32'd16;
#10;
$display("ADDR = %d | INSTRUCTION = %h", addr, rd);

// Instruction 5
addr = 32'd20;
#10;
$display("ADDR = %d | INSTRUCTION = %h", addr, rd);

// Instruction 6
addr = 32'd24;
#10;
$display("ADDR = %d | INSTRUCTION = %h", addr, rd);

$display("==============================================");
$display(" SIMULATION FINISHED ");
$display("==============================================");

$finish;

end

endmodule