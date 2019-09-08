function [ W1,W2,b1,b2 ] = update_par( dW2,db2,dW1,db1,W2,b2,W1,b1, learning_rate )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
    W1 = W1 - learning_rate*dW1;
    W2 = W2 - learning_rate*dW2;
    b1 = b1 - learning_rate*db1;
    b2 = b2 - learning_rate*db2;

end

