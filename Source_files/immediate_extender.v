module immediate_extender(
    input [2:0] immsrc,
    input [31:0] instr,

    output reg [31:0] immext
);
always @(*)
begin
    case(immsrc)
    
    3'b000: immext = {{20{instr[31]}}, instr[31:20]};   //I TYPE

    3'b001: immext = {{20{instr[31]}}, instr[31:25], instr[11:7]};  //S TYPE

    3'b010: immext = {{19{instr[31]}},instr[31],instr[7],instr[30:25],instr[11:8],1'b0};  //B TYPE

    3'b011: immext = {instr[31:12],12'b0}; //U TYPE

    3'b100: immext = {{12{instr[31]}},instr[31],instr[19:12],instr[20],instr[30:21],1'b0};  //J TYPE

    default: immext = 32'b0;

    endcase
end
endmodule




