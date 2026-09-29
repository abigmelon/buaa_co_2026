`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:58:02 09/29/2026 
// Design Name: 
// Module Name:    sat_add 
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
module sat_add(
    input [31:0] a,
    input [31:0] b,
    output [31:0] out
    );
	 
	 wire [8:0] sum0;
	 wire [8:0] sum1;
	 wire [8:0] sum2;
	 wire [8:0] sum3;
	 
	assign sum0 = {1'b0, a[7:0]} + {1'b0, b[7:0]};
	assign sum1 = {1'b0, a[15:8]} + {1'b0, b[15:8]};
	assign sum2 = {1'b0, a[23:16]} + {1'b0, b[23:16]};
	assign sum3 = {1'b0, a[31:24]} + {1'b0, b[31:24]};
	
	assign out[7:0] = sum0[8] ? 8'hff : sum0[7:0];
	assign out[15:8] = sum1[8] ? 8'hff : sum1[7:0];
	assign out[23:16] = sum2[8] ? 8'hff : sum2[7:0];
	assign out[31:24] = sum3[8] ? 8'hff : sum3[7:0];


endmodule
