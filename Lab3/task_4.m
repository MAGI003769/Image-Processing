%%
% This script is used for EEE330 Lab_3 Task_3
% Author: Ruihao Wang 
% ID: 1405884
% Zero-padding technique

%%
% Read images and apply 2D fft first
im = imread('lenna512.bmp');

im420 = imread('lenna_ds420.bmp');
[w420, h420] = size(im420);
Im420 = fft2(im420);
Im420 = fftshift(Im420);

im440 = imread('lenna_ds440.bmp');
[w440, h440] = size(im440);
Im440 = fft2(im440);
Im440 = fftshift(Im440);

%%
% Zero padding in frequency domain
new_w = 512;
new_h = 512;
padded420 = my_padding(Im420, 512, 512);
padded440 = my_padding(Im440, 512, 512);
% Following getting absolute values and normalization 
% are just for store results
% abs420 = abs(padded420);
% abs440 = abs(padded440);
% abs420 = (abs420 - min(abs420(:))) / max(abs420(:)) * 256;
% abs440 = (abs440 - min(abs440(:))) / max(abs440(:)) * 256;
% imwrite(abs420, '.\Task-4\im420_fft_padding.jpg');
% imwrite(abs440, '.\Task-4\im440_fft_padding.jpg');

%%
% Apply inverse fft and calculate psnr
factor420 = (new_w*new_h)/(w420*h420);
im420_pad = factor420*abs(ifft2(padded420));
im420_pad = cast(im420_pad, 'uint8');
psnr_420_pad = psnr(im420_pad, im);
imwrite(im420_pad, '.\Task-4\im420_padding.jpg');

factor440 = (new_w*new_h)/(w440*h440);
im440_pad = factor440*abs(ifft2(padded440));
im440_pad = cast(im440_pad, 'uint8');
psnr_440 = psnr(im440_pad, im);
imwrite(im440_pad, '.\Task-4\im440_padding.jpg');

%%
% Use imresize with 'nearest'
im420_near = imresize(im420, [512 512], 'nearest');
psnr_420_near = psnr(im420_near, im);
imwrite(im420_near, '.\Task-4\im420_nearest.jpg');

im440_near = imresize(im440, [512 512], 'nearest');
psnr_440_near = psnr(im440_near, im);
imwrite(im420_near, '.\Task-4\im440_nearest.jpg');

%%
% Use imresize with 'lanczos3'
im420_lan = imresize(im420, [512 512], 'lanczos3');
psnr_420_lan = psnr(im420_lan, im);
imwrite(im420_lan, '.\Task-4\im420_lan.jpg');

im440_lan = imresize(im440, [512 512], 'lanczos3');
psnr_440_lan = psnr(im440_lan, im);
imwrite(im420_lan, '.\Task-4\im440_lan.jpg');
