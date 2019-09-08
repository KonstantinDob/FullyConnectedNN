clc
clear
close all

X_load = cell2mat(struct2cell(load('dataset.mat')));
Y = X_load(37,:);
X = X_load(1:36,:);

X_train = X(:,1:6000); X_test = X(:,6001:10000);
Y_train = Y(:,1:6000); Y_test = Y(:,6001:10000); 
[W1,b1,W2,b2] = initialize();
learning_rate = 1.8; vis = 0;

for i = 1:1000;
    [Z1,A1,Z2,A2] = forward_prop( X_train,W1,b1,W2,b2 );
    cost = cost_func( A2,Y_train );
    [ dZ2,dW2,db2,dZ1,dW1,db1 ] = back_prop( X_train,Y_train,W2,A1,A2 );
    [ W1,W2,b1,b2 ] = update_par( dW2,db2,dW1,db1,W2,b2,W1,b1, learning_rate );
    if vis == 25
        display(cost);
        vis = 0;
    end
    vis = vis+1;
end

prob = predict( X_test,Y_test,W1,b1,W2,b2 );
save('parameter.mat','W1','W2','b1','b2');
