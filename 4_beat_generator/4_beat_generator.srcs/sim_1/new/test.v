`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/07 18:55:38
// Design Name: 
// Module Name: test
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


module test(

    );
    
    reg CLK, CLRN;
    wire Q0, Q1, Q2, Q3;
        
    design_1_wrapper t (CLK, CLRN, Q0, Q1, Q2, Q3);
        
    initial
    begin
      CLK = 0;
      #2 CLRN = 1;
      #2 CLRN = 0;
    end
        
    always
      begin
        #2 CLK = ~CLK;
      end

endmodule
