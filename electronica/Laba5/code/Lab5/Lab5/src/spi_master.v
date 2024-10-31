module pwm_led
#(
    parameter LED_COUNT = 6,       // Количество светодиодов
    parameter COOLDOWN = 23         // Задержка для изменения
)
(
    input clk,                     // Тактовый сигнал
    input button_data,             // Кнопка данных
    input button_send,             // Кнопка отправки
    output [LED_COUNT-1:0] led     // Светодиоды
);

reg [LED_COUNT-1:0] counter;      // Счетчик для управления светодиодами
reg [COOLDOWN-1:0] cooldown;       // Счетчик задержки

initial begin
    counter <= 6'b000000;           // Начальное состояние светодиодов (включены)
    cooldown <= 0;                  // Начальное значение для cooldown
end

always @(posedge clk) begin
    if (cooldown == 0) begin
        if (!button_data) begin      // Увеличение при нажатии кнопки button_data
            cooldown <= (2 ** COOLDOWN) - 1;
            counter <= counter + 1'b1;
        end
        else if (!button_send) begin // Сброс при нажатии кнопки down
            cooldown <= (2 ** COOLDOWN) - 1;
            counter <= 0;
        end
    end else begin
        cooldown <= cooldown - 1'b1; // Отсчитываем задержку
    end
end

assign led = ~counter;               // Инвертируем значения для светодиодов

endmodule
