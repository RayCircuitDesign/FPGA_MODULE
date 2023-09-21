`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:27:16 09/19/2023 
// Design Name: 
// Module Name:    KEY_PAD_MATRICIAL 
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
module KEY_PAD_MATRICIAL(
input [2:0] s,					//clk del modulo
input [3:0] key_in,			//pines para leer las columnas
output reg [3:0] key_out,	//pines para alimentar las final
output reg [3:0] ROM			//datos determinados del key
/*
FORMA FISICA DEL KEY_PAD
| 1  2  3  A |
| 4  5  6  B |
| 7  8  9  C |
| *  0  #  D |
*/
    );
	
	//registros
	reg [1:0] contador_key = 0;
	
	//lectura de keypad
	always @(posedge s[0])
	begin
		//condicion de movimiento en filas
		case(contador_key)
			2'b00:key_out <= 4'b0001;
			2'b01:key_out <= 4'b0010;
			2'b10:key_out <= 4'b0100;
			2'b11:key_out <= 4'b1000;
		endcase
		contador_key <= contador_key + 1'b1;
	end
	
	//lectura de columnas
	always @(*)
	begin
		case(key_out)
			//para la primera fila
			4'b0001:
				begin
					case(key_in)
						4'b1000: ROM <= 4'b0001;//1
						4'b0100: ROM <= 4'b0010;//2
						4'b0010: ROM <= 4'b0011;//3
						4'b0001: ROM <= 4'b1010;//A
					endcase
				end
			//para la segunda fila
			4'b0010:
				begin
					case(key_in)
						4'b1000: ROM <= 4'b0100;//4
						4'b0100: ROM <= 4'b0101;//5
						4'b0010: ROM <= 4'b0110;//6
						4'b0001: ROM <= 4'b1011;//B
					endcase
				end
			//para la tercera fila
			4'b0100:
				begin
					case(key_in)
						4'b1000: ROM <= 4'b0111;//7
						4'b0100: ROM <= 4'b1000;//8
						4'b0010: ROM <= 4'b1001;//9
						4'b0001: ROM <= 4'b1100;//C
					endcase
				end
			//para la cuarta fila
			4'b1000:
				begin
					case(key_in)
						4'b1000: ROM <= 4'b1110;//*
						4'b0100: ROM <= 4'b0000;//0
						4'b0010: ROM <= 4'b1111;//#
						4'b0001: ROM <= 4'b1101;//D
					endcase
				end
		endcase
		
		if(key_in == 4'b0000)
		begin
			ROM <= 4'b0000;
		end
	end

endmodule
