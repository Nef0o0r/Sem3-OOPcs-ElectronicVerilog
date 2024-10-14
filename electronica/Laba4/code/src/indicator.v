module indicator 
#(parameter DELAY = 12)
(
    input clk,
    output [3:0] digits,
    output [7:0] segments
);

reg [7:0] DIGITS [0:10];

initial begin
    DIGITS[0] = 'b00111111; // 0: ABCDEF
    DIGITS[1] = 'b00000110; // 1: BC
    DIGITS[2] = 'b01011011; // 2: ABDEG
    DIGITS[3] = 'b01001111; // 3: ABCDG
    DIGITS[4] = 'b01100110; // 4: BCFG
    DIGITS[5] = 'b01101101; // 5: ACDFG
    DIGITS[6] = 'b01111101; // 6: ACDEFG
    DIGITS[7] = 'b00000111; // 7: ABC
    DIGITS[8] = 'b01111111; // 8: ABCDEFG
    DIGITS[9] = 'b01101111;  // 9: ABCDFG
    DIGITS[10] = 'b00000000;  // ALL
end

reg [DELAY-1:0] delay;
reg [7:0] current_digit;
reg [1:0] digit;
reg [2:0] segment;

initial begin
    delay = 0;
    current_digit = 0;
    digit = 1;
    segment = 0;
end

always @(posedge clk) begin
    if (!delay) begin
        if (!digit) begin
            delay = 1;
            digit = 1;
        end
        if (!segment) begin
            case (digit)
                0: current_digit = DIGITS[3];
                1: current_digit = DIGITS[3];
                2: current_digit = DIGITS[6];
                3: current_digit = DIGITS[3];
                default: current_digit = DIGITS[0];
            endcase
            digit = digit + 1;
        end
        segment = segment + 1;
    end
    else delay = delay + 1;
end

generate
    genvar i;
    for (i = 0; i < 4; i = i + 1) 
        assign digits[i] = digit & (1 << i);
    for (i = 0; i < 8; i = i + 1)
        assign segments[i] = segment & (1 << i);

endmodule
