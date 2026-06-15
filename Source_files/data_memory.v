module data_memory(
    input we,
    input clk,
    input [31:0] a,
    input [31:0] wd,

    output  [31:0] rd
);
//we->write enable = memwrite
//rd = readdata
//rd2->writedata (wd)
//a->memory addr from alu

reg [31:0] mem[0:31];

initial
begin
    mem[1] = 32'd55;
end
//read operation -- conbinational
assign rd = mem[a[31:2]];
//last 2 bits always 0s as the addr increments by 4.

//write operation
always @(posedge clk)
begin
    if(we)
       mem[a[31:2]] <= wd;
end
endmodule