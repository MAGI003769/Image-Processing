%%
% This script is used for EEE330 Lab_2 Task_2
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Evaluate PSNR of different images

%% 
% Read noise free image and add specified types of noise
ref = imread('lenna512.bmp');
im_wn = imnoise(ref,'gaussian', 0, 0.1);
im_sp = imnoise(ref,'salt & pepper', 0.1);
im_low_dynamic_range = imread('lenna512_low_dynamic_range.bmp');
% Save the files
imwrite(im_wn, '.\Task-2\gn.jpg');
imwrite(im_sp, '.\Task-2\sp.jpg');
imwrite(im_low_dynamic_range, '.\Task-2\low_dynamic.jpg');

%%
% Calculate PSNR
psnr_wn = psnr(im_wn, ref);
psnr_sp = psnr(im_sp, ref);
psnr_low = psnr(im_low_dynamic_range, ref);

%%
% Plot histogram
figure(1)
imhist(ref);
title('Reference');
saveas(gcf, '.\Task-2\ref_hist.jpg');

figure(2)
imhist(im_wn);
title('Guassian Noise');
saveas(gcf, '.\Task-2\gn_hist.jpg');

figure(3)
imhist(im_sp)
title('Salt & Pepper')
saveas(gcf, '.\Task-2\SP_hist.jpg')

figure(4)
imhist(im_low_dynamic_range)
title('Low Dynamic Range')
saveas(gcf, '.\Task-2\low_dynamic_hist.jpg')

