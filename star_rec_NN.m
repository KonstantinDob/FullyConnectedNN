clc
clear
close all
%% initiliaze the parametres of NN
load('parameter.mat');

X = [];tic
A = zeros (600) + abs(0.2*rand(600)); 
[rr,cc] = size(A); P = zeros(rr-5,cc-5);
%% adding of stars
stars = 0;
for i = 5:10:rr-5
    for j = 5:10:cc-5
        r = 1+randi(2);
        A(i:i+r-1,j:j+r-1) = ones(r)-0.0*rand(1); % ones - rand: is equal to a brigth variaton
        stars = stars+1;
    end
end
A = imnoise(A,'salt & pepper',0.01); 
%% run recognition algorythm
for i = 3:rr-5
    for j = 3:cc-5
        X = reshape(A(i:i+5,j:j+5),36,1);
        P(i,j) = recognize(X,W1,W2,b1,b2);
        if sum(sum(P(i-2:i,j-2:j))) >= 2 %double one filtration
            P(i-2:i+2,j-2:j+2) = 0;
            P(i,j) = 1;
        end
    end
end
%% calculation of probability
rec = sum(sum(P));
det = rec/stars*100;
str = sprintf('Number of stars: %.1f \nNumber of detected stars: %.1f \nAccuracy: %.1f'...
    ,stars,rec,det);disp(str);
t1 = toc;str = sprintf('Calculation time is: %.4f  s',t1);disp(str);
figure, imshow(A); title('Noise + stars');
figure, imshow(P); title('Centres of the stars');
