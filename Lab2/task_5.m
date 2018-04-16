%%
% This script is used for EEE330 Lab_2 Task_5
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Filters

%%
% Compare SP image with original one
A = imread('lenna512.bmp');
SP = imread('lenna512_SandP.bmp');
SP_psnr = psnr(SP, A);

%%
% Apply median filters
med_3 = medfilt2(SP);
med_5 = medfilt2(SP, [5 5]);
imwrite(med_3, '.\Task-5\med_3.jpg');
imwrite(med_5, '.\Task-5\med_5.jpg');
% Calculate PSNR
med_3_psnr = psnr(med_3, A);
med_5_psnr = psnr(med_5, A);

%%
% Apply average filters
h = fspecial('average', [3 3]);
avg_3 = imfilter(A, h);
imwrite(avg_3, '.\Task-5\avg_3.jpg');
% Calculate PSNR
avg_3_psnr = psnr(avg_3, A);

%%
subplot(221)
imshow(SP)
title([' Salt & Pepper Noise, PSNR', num2str(SP_psnr)])
subplot(222)
imshow(med_3)
title([' 3\times3 Median Filter, PSNR', num2str(med_3_psnr)])
subplot(223)
imshow(med_5)
title([' 5\times5 Median Filter, PSNR', num2str(med_5_psnr)])
subplot(224)
imshow(avg_3)
title([' 3\times3 Average Filter, PSNR', num2str(avg_3_psnr)])
