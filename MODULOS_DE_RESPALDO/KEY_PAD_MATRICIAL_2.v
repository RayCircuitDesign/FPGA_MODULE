`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:11:26 09/20/2023 
// Design Name: 
// Module Name:    KEY_PAD_MATRICIAL_2 
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
module KEY_PAD_MATRICIAL_2(
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
	reg [7:0] key_push = 0;
	
	//lectura de keypad
	always @(posedge s[0])
	begin
		//condicion de activacion en filas
		case(contador_key)
			2'b00:key_out <= 4'b0001;
			2'b01:key_out <= 4'b0010;
			2'b10:key_out <= 4'b0100;
			2'b11:key_out <= 4'b1000;
		endcase
		contador_key <= contador_key + 1'b1;
	end
	
	//concatenacion de los dos buses de datos
	always @(*)
	begin
		key_push = {key_out,key_in};
	end
	
	//lectura de columnas y ROM de salida
	always @(*)
	begin
		case(key_push)
			//para la primera fila
			8'b00011000: ROM <= 4'b0001;//1
			8'b00010100: ROM <= 4'b0010;//2
			8'b00010010: ROM <= 4'b0011;//3
			8'b00010001: ROM <= 4'b1010;//A
			//para la segunda fila
			8'b00101000: ROM <= 4'b0100;//4
			8'b00100100: ROM <= 4'b0101;//5
			8'b00100010: ROM <= 4'b0110;//6
			8'b00100001: ROM <= 4'b1011;//B
			//para la tercera fila
			8'b01001000: ROM <= 4'b0111;//7
			8'b01000100: ROM <= 4'b1000;//8
			8'b01000010: ROM <= 4'b1001;//9
			8'b01000001: ROM <= 4'b1100;//C
			//para la cuarta fila
			8'b10001000: ROM <= 4'b1110;//*
			8'b10000100: ROM <= 4'b0000;//0
			8'b10000010: ROM <= 4'b1111;//#
			8'b10000001: ROM <= 4'b1101;//D
			default: ROM <= 4'b0000;
		endcase
	end
	
endmodule
