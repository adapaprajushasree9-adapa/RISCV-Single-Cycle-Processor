module alu_decoder_tb;
reg [6:0] func7;
reg [2:0] func3;
reg [2:0] aluop;
wire [5:0] alucntrl;

alu_decoder dut(.func7(func7),.func3(func3),.alucntrl(alucntrl),.aluop(aluop));

initial
begin
    $monitor($time," aluop=%b func3=%b func7=%b alucntrl=%d",aluop,func3,func7,alucntrl);
    aluop  = 3'b000;
    func3 = 3'b000;
    func7 = 7'b0000000;

    #10;
     aluop  = 3'b001;
    func3 = 3'b000;
    func7 = 7'b0100000;

    #10;
    aluop  = 3'b100;
    func3 = 3'b000;
    func7 = 7'b0000000;

    #10 $finish;

end
endmodule

