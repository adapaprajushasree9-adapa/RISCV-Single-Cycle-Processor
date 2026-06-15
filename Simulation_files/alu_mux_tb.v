module alu_mux_tb;

reg  [31:0] rd2;
reg  [31:0] immext;
reg         alusrc;

wire [31:0] b;

alu_mux dut(
    .rd2(rd2),
    .immext(immext),
    .alusrc(alusrc),

    .b(b)
);

initial
begin
    $monitor($time," alusrc=%b  rd2=%h  immext=%h b=%h",alusrc,rd2,immext,b);
    
    rd2     = 32'h00000005;
    immext  = 32'h00000010;
    alusrc  = 0;
    #10;

    rd2     = 32'h00000100;
    immext  = 32'hFFFFFFFC;
    alusrc  = 1;
    #10;

    $finish;

end

endmodule
