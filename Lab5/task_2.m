%%
% This script is for EEE330 Lab 5
% Lab is about morphological operations
% Task 2: Car License Plate Recognition
% Author: Ruihao Wang

%%
clc;
clear;

license_len = 8;
char_list = ['A', 'B', 'C', 'D', 'E', 'F',...
             'G', 'H', 'I', 'J', 'K', 'L',...
             'M', 'N', 'O', 'P', 'Q', 'R',...
             'S', 'T', 'U', 'V', 'W', 'X',...
             'Y', 'Z', '0', '1', '2', '3',...
             '4', '5', '6', '7', '8', '9'];
%%
% Read the plate image to be recogonized
im_license = imread('car_license_plate.png');
max_ = max(im_license(:));
quant = zeros(size(im_license), 'uint8') + max_;
im_license_bw = round(im_license ./ quant) > 0;

%%
% Call function to detect characters
result = detect_car_license_plate_v1_new(im_license_bw, char_list);
disp(result);

% Call function to detect characters v2
result = detect_car_license_plate_v2(im_license_bw, char_list);
disp(result);

