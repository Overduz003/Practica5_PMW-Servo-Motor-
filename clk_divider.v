module clk_divider #(parameter FREQ=5000000)(
input clk, rst,
output reg clk_div);

reg [31:0] count; // almacenar la cuenta

// localparam constantNumber = 25000000;//parametro que vamos a utilizar

localparam clk_FREQ = 50000000;
parameter constantNumber = clk_FREQ/(2*FREQ);

always@(posedge clk or posedge rst)
	begin
		if (rst==1)
			begin
			count <= 32'b0;
			end
		else if (count == constantNumber - 1) //importante para reiniciar el reset "rst" 
			begin
			count <= 32'b0;
			end
		else
			begin
			count<= count + 1 ;
			end
	end

always@ (posedge clk or posedge rst)
		begin
			if (rst==1)
				begin
				clk_div <= 0;
				end
			else if (count == constantNumber -1)
				begin
				clk_div=~clk_div;
				end
			else 
				begin
				clk_div <= clk_div;
				end
		end
	
endmodule 