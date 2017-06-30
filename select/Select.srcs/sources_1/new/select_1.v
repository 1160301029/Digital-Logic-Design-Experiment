`timescale 1ns / 1ps

 module select_1(C0,C1,C2,C3,A,B,F);

    input C0,C1,C2,C3,A,B; // ����C0,C1,C2,C3��A��BΪ�����źţ�A,BΪѡ������
    output F;  // ����FΪ����ź�

    reg F; 
      always @  (C0 or C1 or C2 or C3 or A or B) 
         case({A,B}) // ��A,B�����ж�
         2'b00 : F = C0;   // ��ABΪO0�������ΪC0
         2'b01 : F = C1;   // ��ABΪO1�������ΪC1
         2'b10 : F = C2;   // ��ABΪ10�������ΪC1
         2'b11 : F = C3;   // ��ABΪ11�������ΪC1
         endcase
endmodule
