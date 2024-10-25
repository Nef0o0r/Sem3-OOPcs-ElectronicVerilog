module indicator 
(
    input clk,
    output [3:0] digits,
    output [7:0] segments
);

reg [7:0] DIGITS [0:10];

initial begin
    
    DIGITS[0] = 'b11000000; // 0: ABCDEF
    DIGITS[1] = 'b11111001; // 1: BC
    DIGITS[2] = 'b10100100; // 2: ABDEG
    DIGITS[3] = ~'b10110000; // 3: ABCDG
    DIGITS[4] = 'b10011001; // 4: BCFG
    DIGITS[5] = 'b10010010; // 5: ACDFG
    DIGITS[6] = ~'b10000010; // 6: ACDEFG
    DIGITS[7] = 'b11111000; // 7: ABC
    DIGITS[8] = 'b10000000; // 8: ABCDEFG
    DIGITS[9] = 'b10010000;  // 9: ABCDFG
    DIGITS[10] = ~8'b0;  // ALL
end

localparam DELAY = 150000;

reg [24:0] delay;
reg [1:0] digit_index;
reg [7:0] active_segment;

initial begin
    delay = 0;
    digit_index = 3;
end

always @(posedge clk) begin
    if (!delay) begin
        delay <= DELAY;
        digit_index <= digit_index + 1'b1;
    end
    else delay <= delay - 1'b1;
end


/*always @(posedge clk) begin
    digit_index <= 1;
end*/

always @(*) begin
    case (digit_index)
        0: active_segment = DIGITS[3];
        1: active_segment = DIGITS[3];
        2: active_segment = DIGITS[6];
        3: active_segment = DIGITS[3];
        default: active_segment = DIGITS[10];
    endcase
end

assign digits = ~(4'b0001 << digit_index);
assign segments = active_segment;

endmodule
