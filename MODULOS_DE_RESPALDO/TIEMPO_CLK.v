`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:39:38 09/19/2023 
// Design Name: 
// Module Name:    TIEMPO_CLK 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module TIEMPO_CLK(clk,s
   );
	input clk;
	output reg [2:0] s;
	reg[27:0] r = 28'd0,
				r1 = 28'd0,
				r2 = 28'd0;
	parameter p = 28'd250000,//400Hz
				p1 = 28'd20000000,//2Hz
				p2 = 28'd2500000;//40Hz
	
	always @(posedge clk)
	begin
		r <= r+28'd1;
		r1 <= r1+28'd1;
		r2 <= r2+28'd1;
		//400Hz
		if(r >= (p - 1))
			r <= 28'd0;
			s[0] <= (r < p/2)?1'b1:1'b0;
		//10Hz
		if(r1 >= (p1 - 1))
			r1 <= 28'd0;
			s[1] <= (r1 < p1/2)?1'b1:1'b0;
		//40Hz
		if(r2 >= (p2 - 1))
			r2 <= 28'd0;
			s[2] <= (r2 < p2/2)?1'b1:1'b0;
	end

endmodule
