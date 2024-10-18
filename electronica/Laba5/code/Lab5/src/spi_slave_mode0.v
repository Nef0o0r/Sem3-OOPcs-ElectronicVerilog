module spi_slave_mode0 (
    input clk,        // внутренний тактовый сигнал
    input rst,        // сброс
    input SCLK,       // синхросигнал от ведущего
    input SS,         // выбор ведомого (Slave Select)
    input MOSI,       // принимаемые данные от ведущего
    output reg [7:0] data_out, // принятые данные
    output reg MISO   // данные для передачи (если двунаправленная передача)
);

    reg [7:0] shift_reg;    // сдвиговый регистр для приёма данных
    reg [2:0] bit_counter;  // счетчик битов

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            bit_counter <= 0;
            shift_reg <= 8'b0;
            data_out <= 8'b0;
            MISO <= 1'b0;
        end else if (SS == 0) begin  // ведомый активен, когда SS низкий
            if (SCLK == 1) begin  // данные принимаются на переднем фронте SCLK (с 0 на 1)
                shift_reg <= {shift_reg[6:0], MOSI}; // сдвиг данных с MOSI
                bit_counter <= bit_counter + 1;
            end
            if (bit_counter == 7) begin
                data_out <= shift_reg; // после приема 8 бит сохраняем данные
            end
        end
    end
endmodule
