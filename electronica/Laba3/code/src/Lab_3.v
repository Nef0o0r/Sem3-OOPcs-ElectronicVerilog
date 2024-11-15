module led_controller 
#(parameter COOLDOWN = 21)
(
    input wire clk,
    input wire [2:0] switches,   // Три переключателя
    input up,                    // Кнопка для инверсии состояния
    output [2:0] leds        // Три светодиода
);

    reg invert = 0;              // Флаг для инверсии состояния светодиодов
    reg [COOLDOWN-1:0] cooldown; // Таймер для обработки дребезга
    reg [2:0] to_leds;

initial
begin
    to_leds = 3'b111;
    cooldown <= 0;
end
   // Логика инверсии состояния при нажатии кнопки
    always @(posedge clk) begin
        if (!up && cooldown == 0) begin
            cooldown <= 2**COOLDOWN-1;   // Устанавливаем таймер после нажатия кнопки
            invert <= ~invert;              // Переключаем флаг инверсии
        end
        else begin
            cooldown <= cooldown - 1'b1;       // Уменьшаем таймер, пока он не станет равным нулю
        end
    end


    // Управление светодиодами в зависимости от флага инверсии и состояния переключателей
    always @(posedge clk) begin
        if (invert) begin
            to_leds <= ~switches;        // Инвертируем состояние переключателей для светодиодов
        end
        else begin
            to_leds <= switches;         // Отображаем состояние переключателей напрямую
        end
    end
    assign leds = to_leds;
    
endmodule