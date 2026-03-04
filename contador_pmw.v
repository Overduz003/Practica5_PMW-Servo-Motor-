module contador_pmw #(parameter bloqueo = 180)(
    input clk, rst,
	 input [7:0] SW,
    output reg pmw,
	 output reg [0:6] HEX0, HEX1, HEX2

);

 // 10MH
parameter MAX = 100000;
reg [31:0] counter;
wire [31:0] y;
//assign y = ((5000*SW)/180) + 5000;


reg [7:0] LIM;
wire [6:0] h0, h1, h2;

//--------Bloqueador---------------
always@(posedge clk or posedge rst)
	begin
		if(rst == 1)
			LIM <=0;
		else if ( SW >= bloqueo)
			LIM <= bloqueo;
		else
			LIM<=SW;
	end
			
			
BCD_4display DUT3 (
	.bcd_in(LIM),
	.D_un(h0),
	.D_de(h1),
	.D_ce(h2));
	
always@(*)
	begin
		HEX0= h0;
		HEX1= h1;
		HEX2= h2;
	end
//-------------------------------------

// Conversor de angulo --> pulso

assign y = ((500 * LIM)/9) + 2500;

//---------Contador----------------------
always @(posedge clk or posedge rst)
	begin
		if (rst) 
			counter <= 0;
		else if (counter >= MAX - 1)
			counter <= 0;
		else
			counter <= counter + 1;
	end


//--------GENERADOR PMW---------------

always@(posedge clk or posedge rst)
	begin
		if(rst) 
			pmw <= 0;
		else if ( counter <= y)				
			pmw <= 1;
		else
			pmw <= 0;
	end
 

endmodule