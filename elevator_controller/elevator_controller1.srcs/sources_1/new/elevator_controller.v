`timescale 1ns / 1ps

module elevator_controller(clk,sure,clear,reset,floor,now_floor,
aim_floor,up,down,up_or_down,on_or_off,require_time,over_weight,over_weight_light);

input sure,clear,reset;
input [9:0] floor;
input clk,up,down;
input over_weight;

output [9:0]now_floor;
output [7:0]aim_floor;
output [1:0] up_or_down; //用来指示上升还是下降
output [7:0]require_time; //记录两层之间消耗的时间，最高为9
output on_or_off; //定义电梯门开关的灯 1为开门，0为关门
output over_weight_light;

//直接定义超重灯的亮灭为输入
assign over_weight_light = over_weight;

wire clk,up,down,sure,clear,reset;
wire [9:0] floor;

reg [7:0]aim_floor; //显示目标楼层的七段管
reg [3:0]aim_floor_1; // 目标楼层的二进制数
reg [9:0] now_floor; //改为用LED灯，七段管不够
//reg [7:0]now_floor; //显示当前楼层的七段管
reg [3:0]now_floor_1; // 当前楼层的二进制数
reg [4:0] floor_reg_up,floor_reg_down; //上下楼层的寄存器
reg [1:0]up_or_down; //10是上升 01是下降 00是暂停
reg [7:0]require_time; //显示两层停留之间的运行时间 - 七段管
reg [3:0]require_time_1; //显示两层停留之间的运行时间 - 二进制数
reg [3:0]front_floor; //前一个停留楼层
reg [3:0]back_floor; //后一个停留楼层
reg on_or_off; //定义电梯门开关的灯 1为开门，0为关门

reg clk_stop; //定义停留的时钟沿
reg flag; //判断走不走？ -停留信号

reg clk1;

integer times,counter; //定义用来控制电梯到达楼层后停留的时间

//初始化
initial
begin
clk1 = 0;
counter = 0;
on_or_off = 1; // 预置为开门
flag = 0;
clk_stop = 0;
up_or_down = 2'b10; //初始为上升
floor_reg_up <= 4'b0000; //上升寄存器，初始置为0
floor_reg_down <= 4'b0000; // 下降寄存器，初始置为0
//当前楼层为0
now_floor <= 10'b0000000001;
now_floor_1 <= 4'b0000;
//目标楼层为0
aim_floor <= 8'b11111110;
aim_floor_1 <= 4'b0000;
//花费时间为0
require_time <= 8'b11111110;
require_time_1 <= 4'b0000;

front_floor <= 4'b0000;
end

//分频
always@(posedge clk)
begin
    if(counter==40000000)
    begin
    clk1 = ~clk1;
    counter <= 0;
    end
    else
    begin
    counter <= counter + 1;
    end
end

always @(posedge clk1 or posedge sure or posedge reset or posedge clear or posedge over_weight)
begin

if(over_weight)
begin 
//该处不写逻辑代表电梯不工作
end

else if(reset)
begin
floor_reg_up <= 4'b0000;
up_or_down <= 2'b01;
end

// 目前逻辑一次只能选一次上升楼层，而下降楼层需要在楼梯到达你所在楼层后才能选择，而且下降时不管怎样都会到达一楼
// TODO 
else if(sure)
begin
    //上升输入
    if(up == 1)
    begin
        if(floor[0])
        floor_reg_up <= 4'b0000;
        else if(floor[1])
        floor_reg_up <= 4'b0001;
        else if(floor[2])
        floor_reg_up <= 4'b0010;
        else if(floor[3])
        floor_reg_up <= 4'b0011;
        else if(floor[4])
        floor_reg_up <= 4'b0100;
        else if(floor[5])
        floor_reg_up <= 4'b0101;
        else if(floor[6])
        floor_reg_up <= 4'b0110;
        else if(floor[7])
        floor_reg_up <= 4'b0111;
        else if(floor[8])
        floor_reg_up <= 4'b1000;
        else if(floor[9])
        floor_reg_up <= 4'b1001;
        
        //如果门开着，这时可以关门了
        if(on_or_off == 1)
        on_or_off = 0;
        // 如果这时是停留状态，即按下了clear，这时让它上升
        if(up_or_down == 2'b00)
        up_or_down <= 2'b10;
        
    end
    
    //下降输入
    if(down == 1)
    begin
        if(floor[0])
        floor_reg_down <= 4'b0000;
        else if(floor[1])
        floor_reg_down <= 4'b0001;
        else if(floor[2])
        floor_reg_down <= 4'b0010;
        else if(floor[3])
        floor_reg_down <= 4'b0011;
        else if(floor[4])
        floor_reg_down <= 4'b0100;
        else if(floor[5])
        floor_reg_down <= 4'b0101;
        else if(floor[6])
        floor_reg_down <= 4'b0110;
        else if(floor[7])
        floor_reg_down <= 4'b0111;
        else if(floor[8])
        floor_reg_down <= 4'b1000;
        else if(floor[9])
        floor_reg_down <= 4'b1001;
        
        //如果门开着，这时可以关门了
        if(on_or_off == 1)
        on_or_off = 0;
        // 如果这时是停留状态，即按下了clear，这时让它下降
        if(up_or_down == 2'b00)
        up_or_down <= 2'b01;
    end

    
end

else if(clear)
begin
floor_reg_up <= now_floor_1;
floor_reg_down <= now_floor_1;
up_or_down <= 2'b00;
end

else if(clk1 && !flag)
begin
    if(up_or_down == 2'b10)
    begin
        if(now_floor_1 < floor_reg_up)
        now_floor_1 <= now_floor_1 + 4'b0001;
        else if(now_floor_1 == floor_reg_up)
        begin
            require_time_1 <= now_floor_1 - front_floor;
            front_floor <= now_floor_1;
            // 判断上面是否有楼层要下楼，有的话电梯继续向上
            if(floor_reg_down > now_floor_1)
            floor_reg_up <= floor_reg_down;
            else  // 否则的话直接上升置零，状态改为下降
            begin
            floor_reg_up <= 4'b0000; 
            up_or_down <= 2'b01;
            end
            on_or_off = 1; //电梯这时要开门
            flag = 1;     //停留信号打开
            times = 5;    //停留倒计时置5
        end
    end
    else if(up_or_down == 2'b01)
    begin
        if(now_floor_1 > floor_reg_down)
        now_floor_1 <= now_floor_1 - 4'b0001;
        else if(now_floor_1 == floor_reg_down)
        begin
            if(now_floor_1 == 4'b0000) //到了0层
            begin
            require_time_1 <= front_floor - now_floor_1;
            front_floor <= now_floor_1;
            on_or_off = 1; //开门
            up_or_down <= 2'b00; // 设为停留状态，等待召唤
            floor_reg_down <= 4'b0000;
            end
            else
            begin
            require_time_1 <= front_floor - now_floor_1;
            front_floor <= now_floor_1;
            floor_reg_down <= 4'b0000;
            on_or_off = 1; // 开门
            times = 5;  // 停留倒计时置5
            flag = 1;  //停留信号为1
            end
        end
    end
    
end

else if(clk1 && flag)
begin
times = times - 1;
if(times == 0)
begin
flag = 0;
on_or_off = 0;
end
end

end

always @(negedge clk1)
begin
//每次clk都刷新当前楼层和目标楼层
        case(now_floor_1)
        4'b0000:now_floor <= 10'b0000000001;
        4'b0001:now_floor <= 10'b0000000010;
        4'b0010:now_floor <= 10'b0000000100;
        4'b0011:now_floor <= 10'b0000001000;
        4'b0100:now_floor <= 10'b0000010000;
        4'b0101:now_floor <= 10'b0000100000;
        4'b0110:now_floor <= 10'b0001000000;
        4'b0111:now_floor <= 10'b0010000000;
        4'b1000:now_floor <= 10'b0100000000;
        4'b1001:now_floor <= 10'b1000000000;
        endcase
        
        if(up_or_down == 2'b10)
        aim_floor_1 <= floor_reg_up;
        else if(up_or_down == 2'b01)
        aim_floor_1 <= floor_reg_down;
        
        case(aim_floor_1)
        4'b0000:aim_floor <= 8'b11111110;
        4'b0001:aim_floor <= 8'b10000110;
        4'b0010:aim_floor <= 8'b11101101;   
        4'b0011:aim_floor <= 8'b11111001;
        4'b0100:aim_floor <= 8'b10110011;
        4'b0101:aim_floor <= 8'b11011011;
        4'b0110:aim_floor <= 8'b11011111;
        4'b0111:aim_floor <= 8'b11110000;
        4'b1000:aim_floor <= 8'b11111111;
        4'b1001:aim_floor <= 8'b11111011;
        endcase
        
        case(require_time_1)
        4'b0000:require_time <= 8'b11111110;
        4'b0001:require_time <= 8'b10000110;
        4'b0010:require_time <= 8'b11101101;   
        4'b0011:require_time <= 8'b11111001;
        4'b0100:require_time <= 8'b10110011;
        4'b0101:require_time <= 8'b11011011;
        4'b0110:require_time <= 8'b11011111;
        4'b0111:require_time <= 8'b11110000;
        4'b1000:require_time <= 8'b11111111;
        4'b1001:require_time <= 8'b11111011;
        endcase
end


endmodule

// TODO 设置到达指定楼层后暂停
// 设置计时功能
// 上下的方式还有待改进
// 考虑用10个开关来做
// 附加功能加什么？ 
// 开关门的灯
// 超重？
// 电梯定时无人按自动回1楼？
// 电梯门的开关？ led灯？
// 电梯上下的LED灯?

