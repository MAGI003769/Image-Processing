%%
% This script is used for EEE330 Lab_2 Task_3
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Linear contrast stretching

%%
A = imread('lenna512_low_dynamic_range.bmp');
thresh = [100 20 155 235];   % ?????
im_new = piecewise_mapping(A, thresh);

%%
figure(1)
subplot(121)
imshow(A);
title('Original Image');
subplot(122)
imshow(im_new);
title('Linear Piecewise Mapping');
imwrite(im_new, '.\Task-3\linear_piecewise [100 20 155 235].jpg');

%%
figure(2)
imhist(A)
saveas(gcf, '.\Task-3\origin_hist.jpg');
figure(3)
imhist(im_new)
saveas(gcf, '.\Task-3\linear_hist_[100 20 155 235].jpg');