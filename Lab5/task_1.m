%%
% This script is for EEE330 Lab 5
% Lab is about morphological operations
% Task 1: Counting Coins
% Author: Ruihao Wang

%%
clear;
clc;

%%
% Read images and convert to HSV for binarization
im_coins = imread('Coins.jpg');
im_coins = imresize(im_coins, 0.2, 'bicubic');
im_coins = rgb2hsv(im_coins);
imwrite(im_coins, './Task_1/hsv_coin.jpg');
im_coins = im_coins(:,:,2);
imwrite(im_coins, './Task_1/satu_coin.jpg');
im_BW = ~im2bw(im_coins, 0.35);

%%
% Define structuring element
SE_d = strel('disk', 5, 8);
im_d = imdilate(im_BW, SE_d);
coin_radius = 35;
SE_e = strel('disk', coin_radius, 8);
im_out = imerode(im_d, SE_e);
im_out_ = bwmorph(im_out, 'shrink', Inf);

figure
subplot(1, 4, 1)
imshow(im_BW);
imwrite(im_BW, './Task_1/coin_bw.jpg');

subplot(1, 4, 2)
imshow(im_d);
imwrite(im_d, './Task_1/coin_dilate.jpg');

subplot(1, 4, 3)
imshow(im_out);
imwrite(im_out, './Task_1/coin_out.jpg');

subplot(1, 4, 4)
imshow(im_out_);
imwrite(im_out_, './Task_1/coin_shrink.jpg');

% s = regionprops(im_out,'centroid');
% count = size(s, 1);
count = sum(im_out_(:));
output_str = 'There are %d coins in this image.';
str = sprintf(output_str, count);
disp(str);
