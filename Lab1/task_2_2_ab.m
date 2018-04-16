%%
% This script is used for EEE330 Lab_1 Task_2_2
% Method: Nearset Neighbor Intepolation
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Down-sampling and Up-sampling 

%%
% Down-sample original image using nearest neighbor interpolation
I_0 = imread('lenna512.bmp');
I_1 = imresize(I_0, 0.5, 'nearest');
figure(1);
imshow(I_0);
imwrite(I_0, gray(256), '.\Task-2-2\original.jpg');
figure(2);
imshow(I_1);
imwrite(I_1, gray(256), '.\Task-2-2\nearest_down.jpg');

%%
% Up-sample the previous down-sampled image using nearest neighbor
% interpolation
I_1_prime = imresize(I_1, 2.0, 'nearest');
figure(3);
imshow(I_1_prime);
imwrite(I_1_prime, gray(256), '.\Task-2-2\nearest_recover.jpg');

%%
% Calculate PSNR
peaksnr = psnr(I_1_prime, I_0);
fprintf('\n The Peak-SNR value is %0.4f', peaksnr);
