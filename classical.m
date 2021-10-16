close all;clear;clc
a = input('请输入游走步数：');
x = -a:1:a;
X = 2*a+1;
st = a+1;
P = zeros(1,X);
P(1,st) = 1;%从中点开始出发，概率为一，
Position(st)=1;
while a
    loc = find(Position);%确定粒子当前可能位置
    for i=1:length(loc)
        temp=loc(i);%对每个概率位置迭代
        if(temp == 1)
            break;
        end
        P(1,temp-1) = P(1,temp-1) + P(1,temp)/2;
        P(1,temp+1) = P(1,temp+1) + P(1,temp)/2;
        P(1,temp) = 0;
        Position(1,temp-1)=1;
        Position(1,temp+1)=1;
        Position(1,temp)=0;
    end  
        a=a-1;
end
figure(1)
plot(x,P);
xlabel('position');
ylabel('probability');
title('经典随机漫步概率分布','color','blue');