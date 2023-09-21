`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    23:26:06 09/19/2023 
// Design Name: 
// Module Name:    MASTER 
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
module MASTER(
input clk,					//reloj del FPGA 100MHz
input wire [3:0] key_in,		//pines para leer las columnas
output [3:0] key_out,	//pines para alimentar las final
output [3:0] ROM			//datos determinados del key
    );
	
	//REGISTROS
	
	//CABLES
	wire [2:0] s;
	
	//INSTANCIAS
	TIEMPO_CLK temporizacion(clk,s);
	//KEY_PAD_MATRICIAL teclado_matricial(s,key_in,key_out,ROM);
	KEY_PAD_MATRICIAL_2 teclado_matricial_2(s,key_in,key_out,ROM);
	
endmodule
