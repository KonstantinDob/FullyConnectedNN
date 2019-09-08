function [prob] = predict( X,Y,W1,b1,W2,b2 )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
    [ Z1,A1,Z2,A2 ] = forward_prop( X,W1,b1,W2,b2 );
    P = double(A2>0.5);
    m = length(Y);
    prob = 100-sum(abs(P-Y))/m*100;
    str = sprintf('Prediction mean:  %.1f',prob);disp(str);
end

