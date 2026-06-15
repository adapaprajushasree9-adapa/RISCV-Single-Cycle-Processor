module pctarget_tb;

reg  [31:0] pc;
reg  [31:0] immext;

wire [31:0] pctarget;


pctarget dut(
    .pc(pc),
    .immext(immext),
    .pctarget(pctarget)
);


initial
begin
    $monitor($time,"  pc=%h immext=%h pctarget=%h",pc,immext,pctarget);
    
    pc     = 32'h00000000;
    immext = 32'h00000004;
    #10;

    pc     = 32'h00000100;
    immext = 32'hFFFFFFFC;
    #10;

    $finish;
end
endmodule

   
