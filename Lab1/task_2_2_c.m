%%
% This script is used for EEE330 Lab_1 Task_2_2_c
% Method: Bilinear Interpolation
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Down-sampling and Up-sampling 

%%
% Down-sample original image using bilinear interpolation
I_0 = imread('lenna512.bmp');
I_1 = imresize(I_0, 0.5, 'bilinear');
figure(1);
imshow(I_0);
figure(2);
imshow(I_1);
imwrite(I_1, gray(256), '.\Task-2-2\bilinear_down.jpg');

%%
% Up-sample the previous down-sampled image using bilinear neighbor
% interpolation
I_1_prime = imresize(I_1, 2.0, 'bilinear');
figure(3);
imshow(I_1_prime);
imwrite(I_1_prime, gray(256), '.\Task-2-2\bilinear_recover.jpg');

%%
% Calculate PSNR
peaksnr = psnr(I_1_prime, I_0);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
