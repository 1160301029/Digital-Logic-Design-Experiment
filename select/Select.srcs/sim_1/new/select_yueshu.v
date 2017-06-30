module select_yueshu;

    reg C0,C1,C2,C3,A,B;
    wire F;    
     select_1 ul(C0,C1,C2,C3,A,B,F);
initial
     begin
        A=0;
        B=1;
        C0=0;
        C1=1;
        C2=0;
        C3=0;
     end
     always #5 C3 = ~C3;
     always #5 C1 = ~C1;
     always #10 B = ~B;
endmodule