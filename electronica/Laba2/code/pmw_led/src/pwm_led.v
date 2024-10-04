module pwm_led
#(parameter  LED_COUNT = 6, parameter COOLDOWN = 21) // для симуляции COOLDOWN = 3, для запуска 21
(
    input clk,
    input  up,
    input down,
    output [LED_COUNT-1:0] led  
);


reg [2:0] shift;
reg [COOLDOWN-1:0] cooldown;
reg [2:0] counter;

always @(posedge clk)
begin
    if (counter < LED_COUNT-1)
        counter <= counter + 1'b1;
    else
        counter <= 0;
end

always @(posedge clk)
begin
    if (!cooldown)
    begin
        if (!up)
        begin
            cooldown <= 2**COOLDOWN-1;
            if (shift < LED_COUNT-1)
                shift <= shift + 1'b1;
            else
                shift <= 0;
    end
    else if (!down)
    begin
        cooldown <= 2**COOLDOWN-1;
        if (shift > 0)
            shift <= shift - 1'b1;
        else
            shift <= LED_COUNT-1;
        end
    end
    else
        cooldown <= cooldown - 1'b1;
end

genvar i;
generate
        for (i = 0; i < LED_COUNT; i = i + 1)
        begin : led_block  
            assign led[i] = counter > i % LED_COUNT;
        end
endgenerate

endmodule