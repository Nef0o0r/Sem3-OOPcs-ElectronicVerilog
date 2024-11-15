module led_controller 
(
    input wire clk,
    input wire [2:0] switches,   // Три переключателя
    input up,                    // Кнопка для инверсии состояния
    output [2:0] leds        // Три светодиода
);

    reg invert = 0;              // Флаг для инверсии состояния светодиодов
    reg [31:0] cooldown; // Таймер для обработки дребезга
    reg temp_button;
    reg [2:0] to_leds;

initial
begin
    to_leds = 3'b111;
    cooldown <= 0;
    temp_button <= 1;
end
   // Логика инверсии состояния при нажатии кнопки
    always @(posedge clk) begin
        cooldown <= cooldown + 1;
        temp_button <= up; //значение кнопки
        if(cooldown > 4194304)
        begin
            if(up && temp_button != up)
                begin
                invert <= ~invert;                                  // Переключаем флаг инверсии
                cooldown <= 0;                            // Уменьшаем таймер, пока он не станет равным нулю
            end
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