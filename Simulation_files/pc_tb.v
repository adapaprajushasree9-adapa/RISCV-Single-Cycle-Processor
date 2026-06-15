module pc_tb;
reg clk,rst;
reg [31:0] pcnext;
wire [31:0] pc;

program_counter m1(.clk(clk),.rst(rst),.pc(pc),.pcnext(pcnext));

always #5 clk=~clk;
initial
begin
$monitor($time," rst=%b   pcnext=%d   pc=%d",rst,pcnext,pc);
rst=1;clk=0;pcnext=0;
#10 rst=0;pcnext=32'd00000018;
#10 pcnext=32'd00000200;
#10 pcnext=32'd12345678;

#10 $finish;
end
endmodule
