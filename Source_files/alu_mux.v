module alu_mux(
    input [31:0] rd2,
    input [31:0] immext,
    input alusrc,

    output [31:0] b 
);//b->srcB , rd2 from register file

assign b = alusrc ? immext : rd2;

endmodule
