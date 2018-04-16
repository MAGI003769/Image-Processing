%%
% This script is used for EEE330 Lab_2 Task_4
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Histogram Equalization

%%
A = imread('lenna512_low_dynamic_range.bmp');
im_new = hist_eq(A, 256);
im_mat = histeq(A, 256);
imwrite(im_new, '.\Task-4\hist_eq.jpg');
imwrite(im_mat, '.\Task-4\hist_eq_mat.jpg');

%%
subplot(231)
imshow(A);
title('Original Image');
subplot(232)
imshow(im_new);
title('Histogram Equalized');
subplot(233)
imshow(im_mat);
title('Equalization with Toolbox');
subplot(234)
imhist(A);
subplot(235)
imhist(im_new);
subplot(236)
imhist(im_mat);

% figure(1)
% imhist(A);
% saveas(gcf, '.\Task-4\ref_hist.jpg');
% 
% figure(2)
% imhist(im_new);
% saveas(gcf, '.\Task-4\my_hist.jpg');
% 
% figure(3)
% imhist(im_mat)
% saveas(gcf, '.\Task-4\mat_hist.jpg')