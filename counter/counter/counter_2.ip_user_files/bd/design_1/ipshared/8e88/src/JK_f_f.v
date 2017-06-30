`timescale 1ns / 1ps

module JK_f_f(clk,,clr,J,K,Q,Qb);

input clk,J,K,clr;
output Q,Qb;
reg Q,Qb;

always@(negedge clk or posedge clr)
if(!clr)
begin
Q = 0;
Qb = 1;
end
else
begin 
    case({J,K})
    2'b00 : Q=Q;
    2'b01 : Q=0; 
    2'b10 : Q=1;
    2'b11 : Q=~Q; 
    endcase
    Qb = ~Q;
end

endmodule
