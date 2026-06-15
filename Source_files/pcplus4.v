
module pcplus4(input wire [31:0] pc,

               output wire [31:0] pcplus4);
assign  pcplus4 = pc + 32'd4;
endmodule               