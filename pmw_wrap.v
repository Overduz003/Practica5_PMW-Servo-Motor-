module pmw_wrap(
	input MAX10_CLK1_50,
	input [9:0] SW,
	input [1:0] KEY,
	output [14:0] ARDUINO_IO,
	output [0:6] HEX0, HEX1, HEX2
);

wire link;

clk_divider DUT1 (
	.clk(MAX10_CLK1_50),
	.rst(~KEY[0]),
	.clk_div(link));

contador_pmw DUT2 (
	.clk(link),
	.rst(~KEY[0]),
	.SW(SW[7:0]),
	.pmw(ARDUINO_IO[0]),
	.HEX0(HEX0),
	.HEX1(HEX1),
	.HEX2(HEX2)
);
endmodule