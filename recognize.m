function [ P ] = recognize( X,W1,W2,b1,b2 )
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
    [ Z1,A1,Z2,A2 ] = forward_prop( X,W1,b1,W2,b2 );
    P = double(A2>0.5);

end

