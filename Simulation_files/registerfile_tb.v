module registerfile_tb;
reg [4:0] a1,a2,a3;
reg clk;
reg [31:0] wd3;
reg we3;
wire [31:0] rd1,rd2;

registerfile dut(.clk(clk),.a1(a1),.a2(a2),.a3(a3),.rd1(rd1),.rd2(rd2),.we3(we3),.wd3(wd3));
always #5 clk=~clk;
initial
begin
    $dumpfile("registerfile.vcd");
    $dumpvars(0,registerfile_tb);
    $monitor($time,"  we3=%b a1=%d a2=%d a3=%d wd3=%d rd1=%d rd2=%d",we3,a1,a2,a3,wd3,rd1,rd2);

    clk=0;a1=0;a2=0;a3=0;
    we3=0;wd3=0;

    #10 we3=1;a3=5'd1;wd3=32'd25;
    #10 a3=5'd2;wd3=32'd100;
    #10 we3=0;a1=5'd1;a2=5'd2;
    #10 we3=1;a3=5'd0;wd3=32'd999;
    #10 we3=0;a1=5'd0;a2=5'd1;
    
    #10 $finish;
end
endmodule