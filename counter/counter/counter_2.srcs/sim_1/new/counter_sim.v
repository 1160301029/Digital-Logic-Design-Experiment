`timescale 1ns / 1ps

module counter_sim();

reg CLK,clr,N;
wire A0,A1,A2,A3;
design_1 ul(A0,A1,A2,A3,CLK,N,clr);
initial
begin
 CLK = 0;
 clr = 0;
 N = 1; 
 end
 always #5 CLK=~CLK;
 always #100 clr=~clr;
endmodule
