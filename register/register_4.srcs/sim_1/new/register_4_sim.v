`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/07 19:37:04
// Design Name: 
// Module Name: register_4_sim
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


module register_4_sim();
  reg [3:0]D;
reg Rd,WR,CS;
wire [3:0]DATA;
register_4 ul(D,Rd,WR,CS,DATA);
initial
begin
 CS=0;
 WR=0;
 Rd=0;
 D=4'b0000;
end
 always #5 CS=~CS;
 always #10 WR=~WR;
 always #20 Rd=~Rd;
 always #40 D = D + 4'b0001;
  

endmodule
