`timescale 1ns / 1ps


module d_f_f( Q ,CLK ,RESET ,SET ,D ,Qn );

input CLK ;
 wire CLK ;
input RESET ;
wire RESET ;
input SET ;
 wire SET ;
input D ;
wire D ;

output Q ;
reg Q ;
output Qn ;
wire  Qn ;

assign Qn = ~Q ;

always @ ( posedge CLK or negedge SET or negedge RESET )
begin 
      if ( !RESET) 
          Q  <= 0 ;  
       else if ( ! SET)
           Q <= 1;
      else Q <= D;
            
end

endmodule
