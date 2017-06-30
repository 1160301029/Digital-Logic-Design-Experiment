`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2017/06/28 03:31:11
// Design Name: 
// Module Name: mimasuo
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


module mimasuo(A0,A1,A2,A3,judge,reset,set,clk,red,green,light);
input clk;
input [3:0] A0;
input [3:0] A1;
input [3:0] A2;
input [3:0] A3;
input judge,reset,set;
output red,green;
output [7:0] light;

reg [7:0] light;
reg red,green;
reg clk1;
reg [3:0]B0,B1,B2,B3;
reg flag;
reg flag1;
reg [2:0] times;
integer counter;

initial
begin
times <= 3'b101;
flag1 =0;
flag = 0;
counter = 0;
clk1 = 0;
red = 0;
green = 0;
end

always @(posedge clk)
begin
if(counter == 40000000)
begin
clk1 = ~clk1;
counter = 0;
end
else if(flag)
counter <= counter +1;
end

always @(posedge set or posedge reset or posedge judge or posedge clk1)
begin

if(reset)
begin
flag1 = 0;
green = 0;
red =0;
end
else if(set)
begin
B0 <= A0;
B1 <= A1;
B2 <= A2;
B3 <= A3;
flag = 1;
end
else if(judge)
begin
if(A0==B0)
begin
end
else
begin
flag1 = 1;
end
if(A1==B1)
begin
end
else
begin
flag1 = 1;
end
if(A2==B2)
begin
end
else
begin
flag1 = 1;
end
if(A3==B3)
begin
end
else
begin
flag1 = 1;
end

if(flag1)
begin
red = 1;
flag = 0;
end
else
begin
green = 1;
flag = 0;
end

end

else if(clk1)
begin
    times <= times - 3'b001;
    case(times)
    3'b000:light <= 8'b11111110;
    3'b001:light <= 8'b10000110;
    3'b010:light <= 8'b11101101;   
    3'b011:light <= 8'b11111001;
    3'b100:light <= 8'b10110011;
    3'b101:light <= 8'b11011011;
    endcase
    if(times == 3'b000)
    begin
    red = 1;
    flag = 0;   
    end
end


end
endmodule
