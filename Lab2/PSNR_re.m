%%
% This script is used for EEE330 Lab_2 Task_1
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Reimplementation of PSNR calculation

%%
function PSNR = PSNR_re(img, ref)

differ = img - ref;
mse = sum(sum(differ.^2)) / (size(img,1) * size(img,2));
PSNR = 10 * log10(255^2 / mse);
