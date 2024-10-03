module pwm_led
(
    input clk,
    output [LED_COUNT-1:0] led  
);

localparam LED_COUNT = 6;
reg [2:0] counter;

always @(posedge clk)
begin
    if (counter < LED_COUNT-1)
        counter <= counter + 1'b1;
    else
        counter <= 0;
end

genvar i;
generate
        for (i = 0; i < LED_COUNT; i = i + 1)
        begin : led_block  
            assign led[i] = counter > i % LED_COUNT;
        end
endgenerate

endmodule