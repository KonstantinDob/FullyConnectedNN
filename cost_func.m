function [ cost ] = cost_func( A2,Y )
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    m = length(Y);
    cost = -sum(log(A2).*Y)/m;

end

