function [ dZ2,dW2,db2,dZ1,dW1,db1 ] = back_prop( X,Y,W2,A1,A2 )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
    m = length(Y);
    
    dZ2 = A2-Y;
    dW2 = dZ2*A1';dW2 = dW2./m;
    db2 = sum(dZ2,2);db2 = db2./m;
    dZ1 = W2'*dZ2;
    dZ1 = dZ1.*(1-A1.^2);
    dW1 = dZ1*X'; dW1 = dW1./m;
    db1 = sum(dZ1,2); db1 = db1./m;
    

end

