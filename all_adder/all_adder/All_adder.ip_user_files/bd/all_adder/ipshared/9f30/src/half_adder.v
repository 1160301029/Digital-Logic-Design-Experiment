`timescale 1ns / 1ps


module half_adder(A,B,Ci,S);

input A,B;
output Ci,S;

    assign S = (!B && A)|| (!A && B);
    assign Ci = A&&B;
   
endmodule
