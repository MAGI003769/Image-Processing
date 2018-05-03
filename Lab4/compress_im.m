%%
% This is for EEE330 Lab 4
% Image compression

%%
function [rate] = compress_im(im, Qmat, QP, N, file_name)

for i = 1:size(im, 1)/N
    