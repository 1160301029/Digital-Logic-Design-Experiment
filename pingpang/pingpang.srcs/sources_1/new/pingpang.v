`timescale 1ns / 1ps

module pingpang(light_clk,clk,ball,A_key,B_key,A_serve,B_serve,A_score,B_score);
input light_clk; //为了显示分数设置的时钟
input clk; //控制球移动的时钟，用开关控制
input A_key,B_key; //A,B控制发球接球的开关

output [7:0] ball; //球的位置
output A_serve,B_serve; //A,B发球的显示灯
output [8:0] A_score,B_score;// 定义A,B分数的七段管

reg [8:0] A_score,B_score;
reg [3:0]A_score_binary,B_score_binary;
reg [7:0]ball;
reg ball_binary;
reg A_serve,B_serve;
reg state; //0为发球，1为接球
reg ball_state; //球往左往右，0为左，1为右
reg [3:0]ball_place; //球在第几个位置

reg light_place;

integer times,get_score_times;


initial 
begin
get_score_times = 0;
times = 0;
state = 0;
A_serve = 1;
B_serve = 0;
ball_place = 4'b0000;
light_place = 0;
A_score_binary = 4'b0000;
B_score_binary = 4'b0000;
end

always @(posedge light_clk)
begin
if(light_clk)
begin
times = times + 1;
if(times == 4)
begin
times = 0;
light_place = light_place + 1'b1;
begin

if(light_place)
begin
case(A_score_binary)
4'b0000:A_score <= 9'b011111110;
4'b0001:A_score <= 9'b010000110;
4'b0010:A_score <= 9'b011101101;   
4'b0011:A_score <= 9'b011111001;
4'b0100:A_score <= 9'b010110011;
4'b0101:A_score <= 9'b011011011;
4'b0110:A_score <= 9'b011011111;
4'b0111:A_score <= 9'b011110000;
4'b1000:A_score <= 9'b011111111;
4'b1001:A_score <= 9'b011111011;
4'b1001:A_score <= 9'b011111110;
4'b1011:A_score <= 9'b010000110;
endcase

case(B_score_binary)
4'b0000:B_score <= 9'b101111110;
4'b0001:B_score <= 9'b100000110;
4'b0010:B_score <= 9'b101101101;   
4'b0011:B_score <= 9'b101111001;
4'b0100:B_score <= 9'b100110011;
4'b0101:B_score <= 9'b101011011;
4'b0110:B_score <= 9'b101011111;
4'b0111:B_score <= 9'b101110000;
4'b1000:B_score <= 9'b101111111;
4'b1001:B_score <= 9'b101111011;
4'b1001:B_score <= 9'b101111110;
4'b1011:B_score <= 9'b100000110;
endcase
end

else
begin
case(A_score_binary)
4'b0000:A_score <= 9'b101111110;
4'b0001:A_score <= 9'b101111110;
4'b0010:A_score <= 9'b101111110;  
4'b0011:A_score <= 9'b101111110;
4'b0100:A_score <= 9'b101111110;
4'b0101:A_score <= 9'b101111110;
4'b0110:A_score <= 9'b101111110;
4'b0111:A_score <= 9'b101111110;
4'b1000:A_score <= 9'b101111110;
4'b1001:A_score <= 9'b101111110;
4'b1001:A_score <= 9'b100000110;
4'b1011:A_score <= 9'b100000110;
endcase

case(B_score_binary)
4'b0000:B_score <= 9'b011111110;
4'b0001:B_score <= 9'b011111110;
4'b0010:B_score <= 9'b011111110;  
4'b0011:B_score <= 9'b011111110;
4'b0100:B_score <= 9'b011111110;
4'b0101:B_score <= 9'b011111110;
4'b0110:B_score <= 9'b011111110;
4'b0111:B_score <= 9'b011111110;
4'b1000:B_score <= 9'b011111110;
4'b1001:B_score <= 9'b011111110;
4'b1001:B_score <= 9'b010000110;
4'b1011:B_score <= 9'b010000110;
endcase
end
end
end

end
end
always @(posedge clk or posedge A_key or posedge B_key)
begin

if(A_key)
begin
    if(!state)
    begin
        if(A_serve)
        begin
        ball_state = 0;
        state = 1;
        ball_place = 4'b0001;
        end
    end
    if(state)
    begin
        if(ball_place==4'b0001 && ball_state == 0)
        begin
        ball_state = 1;
        end
    end
end

else if(B_key)
begin
    if(!state)
    begin
        if(B_serve)
        begin
        ball_state = 7;
        state = 1;
        ball_place = 4'b1000;
        end
    end
    if(state)
    begin
        if(ball_place==4'b1000 && ball_state == 1)
        begin
        ball_state = 0;
        end
    end
end

else
begin
    if(state)
    begin
    if(ball_state)
    begin
        ball_place = ball_place + 4'b0001;
        if(ball_place == 4'b1001)
        begin
            ball_place = 4'b0000;
            A_score_binary = A_score_binary + 4'b0001;
            state = 0;
            get_score_times = get_score_times + 1;
            if(get_score_times == 5)
            begin
                get_score_times = 0;
                if(A_serve == 1)
                begin
                    A_serve = 0;
                    B_serve = 1;
                end
                else
                begin
                    A_serve = 1;
                    B_serve = 0;
                end
            end
        end
    end
    
    else
    begin
        ball_place = ball_place - 4'b0001;
        if(ball_place == 4'b0000)
        begin
            B_score_binary = B_score_binary + 4'b0001;
            state = 0;
            get_score_times = get_score_times + 1;
            if(get_score_times == 5)
            begin
                get_score_times = 0;
                if(A_serve == 1)
                begin
                    A_serve = 0;
                    B_serve = 1;
                end
                else
                begin
                    A_serve = 1;
                    B_serve = 0;
                end
            end
        end
    end
    
    
    end
    
    case(ball_place)
    4'b0000 : ball <= 8'b00000000;
    4'b0001 : ball <= 8'b00000001;
    4'b0010 : ball <= 8'b00000010;
    4'b0011 : ball <= 8'b00000100;
    4'b0100 : ball <= 8'b00001000;
    4'b0101 : ball <= 8'b00010000;
    4'b0110 : ball <= 8'b00100000;
    4'b0111 : ball <= 8'b01000000;
    4'b1000 : ball <= 8'b10000000;
    endcase
    
end



end
endmodule
