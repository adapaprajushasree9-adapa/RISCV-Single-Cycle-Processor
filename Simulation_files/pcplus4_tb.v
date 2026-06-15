module pcplus4_tb;
reg [31:0] pc;
wire [31:0] pcplus4;

pcplus4 m1(.pc(pc),.pcplus4(pcplus4));

initial
begin
$monitor($time," pc=%d  pcplus4=%d",pc,pcplus4);
pc=32'b0;
#10  pc=32'd00000018;
#10  pc=32'd00000200;
#10  pc=32'd12345678;

#10 $finish;
end
endmodule