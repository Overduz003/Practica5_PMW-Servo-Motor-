module pmw_tb ();
	reg clk;
	reg rst;
	reg [7:0] SW;
	wire pmw;
 	
	
contador_pmw ini (
	.clk(clk),
	.rst(rst),
	.SW(SW),
	.pmw(pmw));
	
//Generar reloj
always #5 clk = ~clk;

initial begin
	clk = 0;
	rst = 1; 
	SW = 0;
	#50;
	
	rst = 0;
	#10;
	
// CASO de prueba
	
	SW= 90;
	#50;
	SW= 180;
	#50;
	SW= 45;
	#50;
	SW= 200;
	#50;
	
	$stop;
end 
endmodule
	
	
	