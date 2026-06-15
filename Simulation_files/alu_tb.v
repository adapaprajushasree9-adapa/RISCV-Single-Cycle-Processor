module alu_tb;
reg [5:0] alucntrl;
reg [31:0] a;
reg [31:0] b;
wire [31:0] aluresult;
wire zero;

alu dut(.alucntrl(alucntrl),.a(a),.b(b),.aluresult(aluresult),.zero(zero));

initial
begin
    $monitor($time," alucntrl=%d  a=%d   b=%d   aluresult=%d  zero=%d",alucntrl,a,b,aluresult,zero);
     
    a = 0; b = 0; alucntrl = 0; 

#10 a = 32'd9; b = 5;alucntrl = 1;

#10 a = -2; b = -4;alucntrl = 8;

#10 a = 8; b = 2;alucntrl = 5;

#10 a = 8; b = 2;alucntrl = 6;

#10 a = 10; b = 12;alucntrl = 9;

#10 a = 4; b = 4;alucntrl = 19;

#10 a = 4; b = 4;alucntrl = 20;

#10 a = 3; b = -4;alucntrl = 23;

#10 a = -6; b = -5;alucntrl = 24;

#10 $finish;

end
endmodule
    
