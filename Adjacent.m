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

