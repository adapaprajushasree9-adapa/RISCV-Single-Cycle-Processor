module resultmux_tb;

reg  [31:0] aluresult;
reg  [31:0] rd;
reg  [31:0] pcplus4;
reg  [31:0] immext;

reg  [1:0] resultsrc;

wire [31:0] result;

resultmux dut(
    .aluresult(aluresult),
    .rd(rd),
    .pcplus4(pcplus4),
    .immext(immext),

    .resultsrc(resultsrc),

    .result(result)
);

initial
begin
    $monitor($time," resultsrc=%b result=%h",resultsrc,result);

    aluresult = 32'h00000011;
    rd        = 32'h00000022;
    pcplus4   = 32'h00000033;
    immext    = 32'h00000044;

    resultsrc = 2'b00;
    #10;

    resultsrc = 2'b01;
    #10;

    resultsrc = 2'b10;
    #10;

    resultsrc = 2'b11;
    #10;

    $finish;

end

endmodule




