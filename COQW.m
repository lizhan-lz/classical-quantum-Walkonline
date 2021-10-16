close all;clear;clc
%一维直线上连续量子漫步概率分布算法实现
a = input("漫步步数：");
t = input("演化时间：");
% a = 50;
% t = 15;
x = -a:1:a;
X = 4*a;
st = 2*a;
P = zeros(1,X);
P(1,st) = 1;%从中点开始出发，概率为一，
Position(st)=1;
%漫步者初态
s0 = zeros(X,1);
s0(st) = 1;
%系统哈密顿量
H = Adjacent(X);
%演化方程,区分演化时间和步数
st = expm(-1i*H*t)*s0;
st
%状态演化
for k = 1:X
    %st = exp(-1i*H2*k).*s0;
    P(k) = abs(st(k))^2;
end
%st
sum(P);
x=-a:a;
plot(x,P(1,a:3*a))
function [M] = Adjacent(n)
%Adjacent 创建line上含n个节点的邻接矩阵
%   n 直线上节点数
%返回值：n维方阵，对应邻接矩阵
M = zeros(n,n);
for i = 1:n-1
    for j = 1:n-1
        if(i==j)
            M(i,j+1)=1;
            M(i+1,j)=1;
        end
    end
end           
end



