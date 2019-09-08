clc
clear
close all

tic
iter = 5000;
star = [];noise = [];

for i = 1:iter
    A = zeros (6);
    A = A + abs(0.0*rand(6));
    A = imnoise(A,'salt & pepper',0.05); 
    N = A;
    
    r = 1+randi(2);
    A(5-r:4,5-r:4) = ones(r);
    A_r = reshape(A,36,1); A_r(37,1) = 1;
    N_r = reshape(N,36,1); N_r(37,1) = 0;
    star = [star,A_r];
    noise = [noise,N_r];
end
t1 = toc;str = sprintf('Calculation time is: %.4f  s',t1);disp(str);

X = [star,noise];
X = X(:,randperm(iter*2));

save('dataset.mat','X');
% vis_coef = ceil(iter*rand(1));
% vis = reshape(star(1:36,vis_coef),6,6);
% imshow(vis);



