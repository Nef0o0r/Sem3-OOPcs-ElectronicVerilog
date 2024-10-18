module spi_master_mode0 (
    input clk,        // тактовый сигнал
    input rst,        // сброс
    input start,      // сигнал начала передачи
    input [7:0] data_in, // данные для передачи
    output reg SCLK,  // синхросигнал
    output reg SS,    // выбор ведомого
    output reg MOSI,  // передаваемые данные
    output reg done   // сигнал окончания передачи
);

    reg [7:0] shift_reg;    // сдвиговый регистр для передачи данных
    reg [2:0] bit_counter;  // счетчик битов

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            SCLK <= 0;
            SS <= 1;
            bit_counter <= 0;
            MOSI <= 0;
            done <= 0;
        end else if (start) begin
            SS <= 0;  // активируем ведомое устройство
            shift_reg <= data_in; // загружаем данные в сдвиговый регистр
            bit_counter <= 0;
            done <= 0;
        end else if (bit_counter < 8) begin
            if (SCLK == 0) begin
                MOSI <= shift_reg[7]; // передаем старший бит на MOSI
                shift_reg <= {shift_reg[6:0], 1'b0}; // сдвигаем данные
            end
            SCLK <= ~SCLK;  // переключаем SCLK (с 0 на 1 и обратно)
            if (SCLK == 1) begin
                bit_counter <= bit_counter + 1;
            end
        end else begin
            SS <= 1;  // завершение передачи
            done <= 1;
        end
    end
endmodule
