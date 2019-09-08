function [ W1,b1,W2,b2 ] = initialize()
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    W1 = rand(50,36)*0.01;
    b1 = zeros(50,1);
    W2 = rand(1,50)*0.01;
    b2 = zeros(1,1);
end

