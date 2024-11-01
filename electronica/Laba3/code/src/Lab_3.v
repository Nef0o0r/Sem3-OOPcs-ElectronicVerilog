//iverilog -o ./compiled ./src/Lab_3.v ./src/indicator_tb.v
//vvp ./compiled
module led_controller 
#(parameter COOLDOWN = 21)
(
    input wire clk,
    input wire [2:0] switches,     // Три переключателя
    input up,      // кнопка для инверсии состояния
    output [2:0] leds         // Шесть светодиодов
);

    reg invert = 0;                // Флаг для инверсии состояния светодиодов
    integer i;
    reg [5:0] to_leds;
    //ssssreg [1:0] cnt;

initial 
begin
    to_leds = 6'b111111;
    cooldown <= 0;
end
   

reg [COOLDOWN-1:0] cooldown;

    // Логика инверсии состояния при нажатии кнопки
    always @(posedge clk) begin
        if (up == 0) invert <= ~invert;     // Переключаем флаг инверсии при нажатии любой кнопки
    end

// Обновление состояния светодиодов в зависимости от переключателей и флага инверсии
always@(*) 
begin
    if (!cooldown)
    begin
        if (!up)
        begin
            cooldown <= 2**COOLDOWN-1;
            to_leds <= ~switches[2:0];
        end
        else to_leds <= switches[2:0];
    end
    assign leds = to_leds;
end

endmodule