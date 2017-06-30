`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/07 18:04:36
// Design Name: 
// Module Name: D_trigger
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


module D_trigger(
    input D,
    input CLK,
    input CLRN,
    output reg Q
    );
    
    always @(posedge CLK or posedge CLRN)
      if(CLRN) Q <= 0;
      else Q <= D;
endmodule
