module spi_master
#(
    parameter LED_COUNT = 6,       // Количество светодиодов
    parameter COOLDOWN = 23         // Задержка для изменения
)
(
    input clk,                     // Тактовый сигнал
    input button_data,             // Кнопка данных
    input button_send,             // Кнопка отправки
    output [LED_COUNT-1:0] led,     // Светодиоды
    output reg [LED_COUNT-1:0] data_out, // Данные для отправки на ведомое устройство
    output reg SCLK,             // Сигнал синхронизации
    output reg MOSI,             // Данные от ведущего
    output reg MISO,
    output reg SS               // Выбор ведомого

);

reg [LED_COUNT-1:0] counter;      // Счетчик для управления светодиодами
reg [COOLDOWN-1:0] cooldown;       // Счетчик задержки
reg [2:0] bit_cnt = 0;             // Счётчик бит (3 бита для 6 тактов)
reg sending = 0;                   // Флаг передачи

initial begin
    counter <= 6'b000000;           // Начальное состояние светодиодов (включены)
    cooldown <= 0;                  // Начальное значение для cooldown
    data_out <= 6'b111111;
    SS <= 1;
end

always @(posedge clk) begin
    
    if (cooldown == 0) begin
        if (!button_data) begin      // Увеличение при нажатии кнопки button_data
            cooldown <= (2 ** COOLDOWN) - 1;
            counter <= counter + 1'b1;
        end
        else if (!button_send) begin // Сброс при нажатии кнопки down
                cooldown <= (2 ** COOLDOWN) - 1;
                data_out <= ~counter;
                counter <= 0;
                SS <= 0;
                bit_cnt <= 0;
                sending <= 1;
            end else if (sending) begin
                        if (bit_cnt < 6) begin
                            SCLK <= ~SCLK;
                            if (SCLK) begin
                                MOSI <= data_out[5];
                                data_out <= {data_out[4:0], 1'b0};
                                bit_cnt <= bit_cnt + 1;
                            end
                        end else begin
                            SS <= 1;
                            sending <=0;
                                 end
                     end
    end else begin
            cooldown <= cooldown - 1'b1; // Отсчитываем задержку
        end
end

assign led = ~counter;               // Инвертируем значения для светодиодов

endmodule
