module spi_slave
(
	input [7:0] data_out,
	output reg [7:0] data_in,

	input SCLK,
	input MOSI,
	output MISO,
	input SS
);

reg state;
reg [2:0] data_counter;

initial
begin
	data_in <= 0;
	state <= 0;
	data_counter <= 0;
end

always @(posedge SCLK)
begin
	if (!SS)
	begin
		if (!state)
		begin
			state = 1;
			data_counter = 7;
		end

		data_in = { data_in[6:0], MOSI };
		if (data_counter == 0) state = 0;
		data_counter = data_counter - 1;
	end
end

assign MISO = state;

endmodule

module slave_control
(
	output [5:0] led,

	input SCLK,
	input MOSI,
	output MISO,
	input SS
);

reg [7:0] data_out;
wire [7:0] data_in;

spi_slave s (data_out, data_in, SCLK, MOSI, MISO, SS);

assign led = ~data_in[5:0];

endmodule
