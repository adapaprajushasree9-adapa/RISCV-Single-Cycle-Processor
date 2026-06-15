module pcmux_tb;
reg [31:0] pcplus4,pctarget;
reg pcsrc;
wire [31:0] pcnext;

pcmux m1(.pcplus4(pcplus4),.pctarget(pctarget),.pcsrc(pcsrc),.pcnext(pcnext));

initial
begin
    $monitor($time," pcsrc=%b  pcnext=%d",pcsrc,pcnext);
     pcplus4 = 32'd4;
     pctarget = 32'd12345678;
     pcsrc = 0;
     #10;
     pcsrc = 1;
     #10;
      $finish;
   end 
endmodule
