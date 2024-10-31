/*
module spi_tb;
    reg clk = 0;
    reg reset = 0;
    reg button_data = 0;
    reg button_send = 0;
    wire SCLK, MOSI, SS;
    wire [5:0] led_master, led_slave;

    // Подключаем ведущий и ведомый модули
    spi_master master (
        .clk(clk),
        .reset(reset),
        .button_data(button_data),
        .button_send(button_send),
        .SCLK(SCLK),
        .MOSI(MOSI),
        .SS(SS),
        .led(led_master)
    );

    spi_slave slave (
        .clk(clk),
        .SCLK(SCLK),
        .MOSI(MOSI),
        .SS(SS),
        .led(led_slave)
    );

    // Генерация тактового сигнала
    always #5 clk = ~clk;

    // Имитируем работу кнопок
    initial begin
        $dumpfile("output.vcd"); // Генерация VCD файла
        $dumpvars(0, spi_tb);     // Запись всех переменных
        
        reset = 1;
        #10 reset = 0;
        #10 button_data = 1; #10 button_data = 0; // Увеличить значение счётчика
        #20 button_send = 1; #10 button_send = 0; // Начать передачу
    end
endmodule
*/
