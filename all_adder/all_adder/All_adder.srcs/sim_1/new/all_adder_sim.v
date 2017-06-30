
module all_adder_sim;

reg A, B, Ci;
wire C,S;

    all_adder ul(A,B,C,Ci,S);

initial
begin
    A = 0;
    B = 0;
    Ci = 1;
end

always #5 A = ~A;
always #10 B = ~B;
always #15 Ci = ~Ci;


endmodule
