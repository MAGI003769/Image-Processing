%%
% This script is used for EEE330 Lab_1 Task_2_1
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Crop the face of the image

%%
% manually crop using matrix operation
ul = [160, 190];
side = [240, 190];
A = imread('lenna512.bmp');
cropped = A(ul(1):ul(1)+side(1), ul(2):ul(2)+side(2));
figure(1);
image(cropped);
colormap gray(256);
truesize;
imwrite(cropped, gray(256), '.\Task-2-1\cropped.jpg');

%%
% use built-in function imcrop
[cropped_2, rect] = imcrop(A);
imwrite(cropped_2, gray(256), '.\Task-2-1\cropped_2.jpg');