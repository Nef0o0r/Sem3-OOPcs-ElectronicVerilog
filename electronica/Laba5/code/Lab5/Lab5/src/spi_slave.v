module spi_slave
#(
    parameter LED_COUNT = 6         // Количество светодиодов
)
(
    input clk,                      // Тактовый сигнал
    input SCLK,                     // Сигнал синхронизации от ведущего
    input MOSI,
    //input MISO,                     // Данные от ведущего
    input SS,                       // Выбор ведомого
    output [LED_COUNT-1:0] led  // Светодиоды
);

reg [LED_COUNT-1:0] data_received; // Данные, принятые от ведущего
reg [2:0] bit_cnt = 0;              // Счётчик бит

initial begin
    data_received = 6'b111111;              // Инициализация принятых данных
    //led = 6'b111111;                // Инициализация светодиодов
end

always @(posedge clk) begin
    if (!SS) begin                   // Если ведомый выбран
        if (SCLK) begin              // Если SCLK активен
            data_received[bit_cnt] <= MOSI; // Сдвиг данных
            bit_cnt <= bit_cnt + 1;  // Увеличение счетчика бит
        end
    end else begin                   // Если ведомый не выбран
        if (bit_cnt == LED_COUNT) begin // Если все данные приняты
            //led <= data_received;    // Отобразить принятые данные на светодиодах
            //data_received <= 0;      // Сброс данных для следующей передачи
            bit_cnt <= 0;            // Сброс счетчика бит
        end
    end
end
assign led = data_received;
endmodule
