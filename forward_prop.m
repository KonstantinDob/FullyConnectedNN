function [ Z1,A1,Z2,A2 ] = forward_prop( X,W1,b1,W2,b2 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    [a,b] = size(X);
    for i = 1:b
        B1(:,i) = b1;
        B2(:,i) = b2;
    end

    Z1 = W1*X + B1;
    A1 = tanh(Z1);
    Z2 = W2*A1 + B2;
    A2 = sigmoid(Z2);

end

