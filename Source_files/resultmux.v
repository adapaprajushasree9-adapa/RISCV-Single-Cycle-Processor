module resultmux(
    input [31:0] aluresult,
    input [31:0] rd,
    input [31:0] pcplus4,
    input [31:0] immext,

    input [1:0] resultsrc,

    output reg [31:0] result
);
always @(*)
begin
    case(resultsrc)
       
     2'b00: result = aluresult;
     2'b01: result = rd;
     2'b10: result = pcplus4;
     2'b11: result = immext;

    endcase
end

endmodule 


       



