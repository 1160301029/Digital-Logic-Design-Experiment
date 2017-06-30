`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/07 18:16:47
// Design Name: 
// Module Name: register_4
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module register_4(    input [3:0]D,

input Rd,
input WR,
input CS,
inout [3:0]DATA
);
reg [3:0]Data_reg;//Ó³Ïñ¼Ä´æÆ÷

always@(posedge CS)
if(WR & ~Rd)   Data_reg <= D;
else if(~WR) Data_reg<=Data_reg;
else Data_reg<=4'bz;
assign DATA = Data_reg;
endmodule
