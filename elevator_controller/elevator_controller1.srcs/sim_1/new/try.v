`timescale 1ns / 1ps

module try();

reg clk,up,down;
reg [9:0] floor;
reg sure;
reg clear;
reg reset;
reg over_weight;
wire [1:0]up_or_down;
wire on_or_off;
wire [9:0] now_floor;
wire [7:0] aim_floor,require_time;
wire over_weight_light;

elevator_controller ul(clk,sure,clear,reset,floor,now_floor,
aim_floor,up,down,up_or_down,on_or_off,require_time,over_weight,over_weight_light);

initial
begin
reset = 0;
clear = 0;
over_weight = 0;
clk = 0;
up = 0;
down = 1;
floor = 10'b1000000000;
sure = 0;
#5 sure = 1;
#10 sure = 0;
end

always #0.01 clk = ~clk;

endmodule
