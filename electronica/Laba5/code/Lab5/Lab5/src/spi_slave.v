/*
module spi_slave (
    input wire clk,
    input wire SCLK,               // Входящий сигнал синхронизации
    input wire MOSI,               // Входящие данные от ведущего
    input wire SS,                 // Входящий сигнал выбора ведомого
    output reg [5:0] received_data, // Принятые данные (6 бит)
    output reg [5:0] led           // Светодиоды для отображения принятых данных (6 ламп)
);
    reg [5:0] shift_reg = 0;
    reg [2:0] bit_cnt = 0;

    // При низком уровне SS начинается приём данных
    always @(posedge SCLK or posedge SS) begin
        if (SS) begin
            // Сброс при высоком уровне SS
            bit_cnt <= 0;
            shift_reg <= 0;
        end else begin
            shift_reg <= {shift_reg[4:0], MOSI}; // Сдвиг в регистре
            bit_cnt <= bit_cnt + 1;
            if (bit_cnt == 5) begin
                received_data <= shift_reg;  // Сохранение принятых данных
                led <= shift_reg;            // Обновление светодиодов (6 ламп)
                bit_cnt <= 0;                // Сброс счётчика
            end
        end
    end
endmodule
*/