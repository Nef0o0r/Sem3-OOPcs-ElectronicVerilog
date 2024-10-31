//iverilog -o ./compiled ./src/Lab_3.v ./src/indicator_tb.v
//vvp ./compiled

module led_controller (
    input wire clk,
    input wire [1:0] buttons,      // Две кнопки
    input wire [5:0] switches,     // Шесть переключателей
    output reg [5:0] leds          // Шесть светодиодов
);

    reg invert;  // Переменная для хранения состояния инверсии
    integer i;

    // Управление светодиодами
    always @(posedge clk) begin
        if (buttons[0] | buttons[1]) begin
            invert <= ~invert;  // Инвертируем состояние при нажатии любой кнопки
        end
    end

    // Обновление состояния светодиодов с учетом переключателей и инверсии
    always @* begin
        for (i = 0; i < 6; i = i + 1) begin
            if (invert)
                leds[i] = ~switches[i];
            else
                leds[i] = switches[i];
        end
    end

endmodule