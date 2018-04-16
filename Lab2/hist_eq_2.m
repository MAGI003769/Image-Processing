%%
% This script is used for EEE330 Lab_2 Task_3
% Author: Ruihao Wang
% ID: 1405884
% Contents: Evaluate PSNR of different images

%%
function [out] = hist_eq_2(im)

h = imhist(im) / numel(im);
cdf = cumsum(h);
out = 255*cdf(double(im)+1);
out = uint8(out);
