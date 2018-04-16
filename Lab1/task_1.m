%%
% This script is used for EEE330 Lab_1 Task_1
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Use different colormap to display and keep the size of image

%%
A = imread('lenna512.bmp');
figure(1);
image(A);
colorbar;

%%
figure(2)
image(A)
colormap cool(256);
truesize;
colorbar;
imwrite(A, cool(256),'./Task-1/cool-256.jpg');

%%
figure(3);
image(A);
colormap hot(255);
truesize;
colorbar;
imwrite(A, hot(255), './Task-1/hot-255.jpg');

%%
figure(4)
image(A)
colormap gray(128);
truesize;
colorbar;
imwrite(A, gray(128),'./Task-1/gray-128.jpg');

%%
figure(5)
image(A)
colormap gray(64);
truesize;
colorbar;
imwrite(A, gray(64), './Task-1/gray-64.jpg');