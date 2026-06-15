module b_bcd_tb;
reg [15:0] binary;

wire [3:0] ones,tens,hundreds,thousands;

binary_to_bcd dut(
    .binary(binary),
    .ones(ones),
    .tens(tens),
    .hundreds(hundreds),
    .thousands(thousands)
);

initial 
begin
    $monitor($time,"  binary=%d   thousands=%d hundreds=%d tens=%d ones=%d",
              binary, thousands, hundreds, tens, ones);

       binary = 0;
    #10;

    binary = 5;
    #10;

    binary = 13;
    #10;

    binary = 21;
    #10;

    binary = 144;
    #10;

    binary = 999;
    #10;

    binary = 1024;
    #10;

    $finish;
end 
endmodule       

