`timescale 1ns / 1ns

module pwm_led_tb();

reg clk;  // Тактовый сигнал
reg up;
reg down;
wire [5:0] led;  // Светодиоды

// Экземпляр тестируемого модуля
pwm_led uut(.clk(clk), .up(up), .down(down), .led(led));

// Генерация тактового сигнала с периодом 10 нс (частота 100 МГц)
initial begin
    clk = 0;
    forever #(5) clk = ~clk;  // Период 10 нс
end

initial
begin
    up <= 1;
    down <= 1;
    #20 up <= 0;
    #180 up <= 1;
    #200 down <= 0;
    #200 down <= 1;
end


// Завершение симуляции через 1000 нс
initial begin
    #1000 $finish;
end

// Сохранение результата симуляции в файл VCD для анализа
initial begin
    $dumpfile("pwm_led_out.vcd");
    $dumpvars(0, pwm_led_tb);
end

endmodule
