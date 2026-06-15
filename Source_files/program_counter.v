//Program counter-PC
module program_counter(input [31:0]pcnext,
          input clk,
          input rst,
          
          output reg [31:0]pc);
initial pc<=32'b0;
always @(posedge clk)
begin
if(rst) pc<=32'b0;
else pc<=pcnext;
end
endmodule
