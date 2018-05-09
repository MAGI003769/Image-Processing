%%
% This function is for EEE330 Lab 4 
% Trial implementation of JPEG
% Author: Ruihao Wang

clear;
clc;

%%
% Read image
I = imread('lenna512.bmp');
I = im2double(I); % !!!

% Paramters to pass into function
N = 8;
QP = 80;
% Quantization matrix
Qmat = [16 11 10 16 24 40 51 61; ... 
        12 12 14 19 26 58 60 55; ...
        14 13 16 24 40 57 69 56; ...
        14 17 22 29 51 87 80 62; ...
        18 22 37 56 68 109 103 77; ...
        24 35 55 64 81 104 113 92; ...
        49 64 78 87 103 121 120 101; ...
        72 92 95 98 112 100 103 99];

%%
% Claculate scale factor
if QP>=100 || QP<=0 
    error('QP should be in range from 0 to 100');
elseif QP>50
    S = (100-QP) / 50;
else
    S = 50/QP;
end

%%
% DCT matrix
T = dctmtx(N);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(I, [N, N], dct);