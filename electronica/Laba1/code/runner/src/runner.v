module runner
(
    input clk,					// Тактирующий сигнал
	input reset,				// Сигнал сброса (1 по умолчанию, 0 при сбросе)
    output [5:0] leds		// Выходы светодиодов
);

reg [32:0] counter;				// Счётчик для переключения светодиодов
reg [2:0] led_counter;			// Состояние

always @(posedge clk)
begin
	if (!reset)
	begin
		counter <= 0;
		led_counter <= 0;
	end
	else
	begin
		counter <= counter + 1;
		if (counter > 100000000) // 4500000 для прошивки (1/6 секунды), 5 для симуляции
		begin
			counter <= 0;
			led_counter <= led_counter + 1;
			if (led_counter == 5)
			begin
				led_counter <= 0;
			end
		end
	end
end

genvar i;
generate
	for (i = 0; i < 6; i = i + 1)
	begin
		assign leds[i] = (reset ? led_counter != i : 0);
	end
endgenerate

endmodule