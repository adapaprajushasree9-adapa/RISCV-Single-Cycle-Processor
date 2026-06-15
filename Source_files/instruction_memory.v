module instruction_memory(
    input [31:0] addr,
    
    output [31:0] rd
);
reg [31:0] imem [0:31];
initial
begin
    
        imem[0] = 32'h00100093; // addi x1,x0,1
        imem[1] = 32'h00000113; // addi x2,x0,0
        imem[2] = 32'h002081B3; // add  x3,x1,x2
        imem[3] = 32'h00008133; // add  x2,x1,x0
        imem[4] = 32'h000180B3; // add  x1,x3,x0
        imem[5] = 32'hFF5FF06F; // jal  x0,loop
    end
assign rd=imem[addr[31:2]];
endmodule

