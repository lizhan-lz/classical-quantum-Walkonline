close all;clear all;clc
%一维直线上离散量子漫步概率辐分布算法实现
a = input('请输入游走步数：');
%a=49;
x = -a:1:a;
X = 4*a;
st = 2*a;
Position(st)=1;%粒子所处概率位置
P = zeros(2,X);
Pro = zeros(1,X);
P(:,st) = 1/sqrt(2)*[1,i];%从中点开始出发，硬币态0\1叠加概率，
%P(:,st) = 1/sqrt(2)*[1,1];%从中点开始出发，硬币态0\1叠加概率，
%硬币算符
H = 1/sqrt(2)*[1,1;1,-1];
%C =(1/sqrt(2)) * [1,1i;1i,1]
step = a;
while step
    step=step-1;
    loc = find(Position);%确定粒子当前可能位置
    for i = 1:length(loc)
        temp = loc(i);%对每个概率位置迭代
        if(temp == 1)
            break;
        end
        %硬币算符操作硬币态
        P(:,temp) = H*P(:,temp);
        %P(:,temp) = C*P(:,temp);
        %迁移算符操作位置态
        %S|n,0>=|n-1,0>,S|n,1>=|n+1,1>
        P(1,temp-1) = P(1,temp-1)+P(1,temp);
        P(2,temp+1) = P(2,temp+1)+P(2,temp);
        P(:,temp) = 0;
        Position(1,temp-1)=1;
        Position(1,temp+1)=1; 
        Position(1,temp)=0;
    end
end
for i=1:X
    Pro(i) = abs(P(1,i))^2+abs(P(2,i))^2;
end
x=-a:a;
plot(x,Pro(1,a:3*a))