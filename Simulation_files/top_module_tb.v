module top_module_tb;
reg clk;
reg rst;

wire [31:0] result;

top_module dut(.clk(clk),.rst(rst),.result(result));

always #5 clk = ~clk;

initial
begin
     
    $monitor(
        $time,
        " pc=%h instr=%h x1=%d x2=%d x3=%d",
        dut.pc,
        dut.instr,
        dut.rf.rf[1],
        dut.rf.rf[2],
        dut.rf.rf[3]
    );
  
    clk = 0;
    rst = 1;
    #10 rst = 0;

    #200 $finish;
end
endmodule                   