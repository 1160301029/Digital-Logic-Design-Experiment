`timescale 1ns / 1ps

 module select_1(C0,C1,C2,C3,A,B,F);

    input C0,C1,C2,C3,A,B; // 定义C0,C1,C2,C3，A，B为输入信号，A,B为选择依据
    output F;  // 定义F为输出信号

    reg F; 
      always @  (C0 or C1 or C2 or C3 or A or B) 
         case({A,B}) // 对A,B进行判断
         2'b00 : F = C0;   // 若AB为O0，则输出为C0
         2'b01 : F = C1;   // 若AB为O1，则输出为C1
         2'b10 : F = C2;   // 若AB为10，则输出为C1
         2'b11 : F = C3;   // 若AB为11，则输出为C1
         endcase
endmodule
