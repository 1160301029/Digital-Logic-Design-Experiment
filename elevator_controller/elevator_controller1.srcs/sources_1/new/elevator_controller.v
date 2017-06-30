`timescale 1ns / 1ps

module elevator_controller(clk,sure,clear,reset,floor,now_floor,
aim_floor,up,down,up_or_down,on_or_off,require_time,over_weight,over_weight_light);

input sure,clear,reset;
input [9:0] floor;
input clk,up,down;
input over_weight;

output [9:0]now_floor;
output [7:0]aim_floor;
output [1:0] up_or_down; //����ָʾ���������½�
output [7:0]require_time; //��¼����֮�����ĵ�ʱ�䣬���Ϊ9
output on_or_off; //��������ſ��صĵ� 1Ϊ���ţ�0Ϊ����
output over_weight_light;

//ֱ�Ӷ��峬�صƵ�����Ϊ����
assign over_weight_light = over_weight;

wire clk,up,down,sure,clear,reset;
wire [9:0] floor;

reg [7:0]aim_floor; //��ʾĿ��¥����߶ι�
reg [3:0]aim_floor_1; // Ŀ��¥��Ķ�������
reg [9:0] now_floor; //��Ϊ��LED�ƣ��߶ιܲ���
//reg [7:0]now_floor; //��ʾ��ǰ¥����߶ι�
reg [3:0]now_floor_1; // ��ǰ¥��Ķ�������
reg [4:0] floor_reg_up,floor_reg_down; //����¥��ļĴ���
reg [1:0]up_or_down; //10������ 01���½� 00����ͣ
reg [7:0]require_time; //��ʾ����ͣ��֮�������ʱ�� - �߶ι�
reg [3:0]require_time_1; //��ʾ����ͣ��֮�������ʱ�� - ��������
reg [3:0]front_floor; //ǰһ��ͣ��¥��
reg [3:0]back_floor; //��һ��ͣ��¥��
reg on_or_off; //��������ſ��صĵ� 1Ϊ���ţ�0Ϊ����

reg clk_stop; //����ͣ����ʱ����
reg flag; //�ж��߲��ߣ� -ͣ���ź�

reg clk1;

integer times,counter; //�����������Ƶ��ݵ���¥���ͣ����ʱ��

//��ʼ��
initial
begin
clk1 = 0;
counter = 0;
on_or_off = 1; // Ԥ��Ϊ����
flag = 0;
clk_stop = 0;
up_or_down = 2'b10; //��ʼΪ����
floor_reg_up <= 4'b0000; //�����Ĵ�������ʼ��Ϊ0
floor_reg_down <= 4'b0000; // �½��Ĵ�������ʼ��Ϊ0
//��ǰ¥��Ϊ0
now_floor <= 10'b0000000001;
now_floor_1 <= 4'b0000;
//Ŀ��¥��Ϊ0
aim_floor <= 8'b11111110;
aim_floor_1 <= 4'b0000;
//����ʱ��Ϊ0
require_time <= 8'b11111110;
require_time_1 <= 4'b0000;

front_floor <= 4'b0000;
end

//��Ƶ
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
//�ô���д�߼�������ݲ�����
end

else if(reset)
begin
floor_reg_up <= 4'b0000;
up_or_down <= 2'b01;
end

// Ŀǰ�߼�һ��ֻ��ѡһ������¥�㣬���½�¥����Ҫ��¥�ݵ���������¥������ѡ�񣬶����½�ʱ�����������ᵽ��һ¥
// TODO 
else if(sure)
begin
    //��������
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
        
        //����ſ��ţ���ʱ���Թ�����
        if(on_or_off == 1)
        on_or_off = 0;
        // �����ʱ��ͣ��״̬����������clear����ʱ��������
        if(up_or_down == 2'b00)
        up_or_down <= 2'b10;
        
    end
    
    //�½�����
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
        
        //����ſ��ţ���ʱ���Թ�����
        if(on_or_off == 1)
        on_or_off = 0;
        // �����ʱ��ͣ��״̬����������clear����ʱ�����½�
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
            // �ж������Ƿ���¥��Ҫ��¥���еĻ����ݼ�������
            if(floor_reg_down > now_floor_1)
            floor_reg_up <= floor_reg_down;
            else  // ����Ļ�ֱ���������㣬״̬��Ϊ�½�
            begin
            floor_reg_up <= 4'b0000; 
            up_or_down <= 2'b01;
            end
            on_or_off = 1; //������ʱҪ����
            flag = 1;     //ͣ���źŴ�
            times = 5;    //ͣ������ʱ��5
        end
    end
    else if(up_or_down == 2'b01)
    begin
        if(now_floor_1 > floor_reg_down)
        now_floor_1 <= now_floor_1 - 4'b0001;
        else if(now_floor_1 == floor_reg_down)
        begin
            if(now_floor_1 == 4'b0000) //����0��
            begin
            require_time_1 <= front_floor - now_floor_1;
            front_floor <= now_floor_1;
            on_or_off = 1; //����
            up_or_down <= 2'b00; // ��Ϊͣ��״̬���ȴ��ٻ�
            floor_reg_down <= 4'b0000;
            end
            else
            begin
            require_time_1 <= front_floor - now_floor_1;
            front_floor <= now_floor_1;
            floor_reg_down <= 4'b0000;
            on_or_off = 1; // ����
            times = 5;  // ͣ������ʱ��5
            flag = 1;  //ͣ���ź�Ϊ1
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
//ÿ��clk��ˢ�µ�ǰ¥���Ŀ��¥��
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

// TODO ���õ���ָ��¥�����ͣ
// ���ü�ʱ����
// ���µķ�ʽ���д��Ľ�
// ������10����������
// ���ӹ��ܼ�ʲô�� 
// �����ŵĵ�
// ���أ�
// ���ݶ�ʱ���˰��Զ���1¥��
// �����ŵĿ��أ� led�ƣ�
// �������µ�LED��?

