module dmem_tb;

reg clk;
reg we;
reg [31:0] a;
reg [31:0] wd;

wire [31:0] rd;

data_memory dut(
    .clk(clk),
    .we(we),
    .a(a),
    .wd(wd),
    .rd(rd)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    $dumpfile("dump.vcd");
    $dumpvars(0,dmem_tb);

    $monitor($time," we=%b  a=%h  wd=%h  rd=%h",we, a, wd, rd);

    
    // WRITE 55 INTO MEMORY[4]
    
    we = 1;
    a  = 32'h00000004;
    wd = 32'h00000037;   // 55 decimal
    #10;

    // READ MEMORY[4]
    we = 0;
    a  = 32'h00000004;
    #10;

    // WRITE 100 INTO MEMORY[8]
    we = 1;
    a  = 32'h00000008;
    wd = 32'h00000064;   // 100 decimal
    #10;

    // READ MEMORY[8]
    we = 0;
    a  = 32'h00000008;
    #10;

    // WRITE ABCD1234 INTO MEMORY[12]
    we = 1;
    a  = 32'h0000000C;
    wd = 32'hABCD1234;
    #10;

    // READ MEMORY[12]
    we = 0;
    a  = 32'h0000000C;
    #10;

    $finish;

end

endmodule