%%
% This script is used for EEE330 Lab_1 Task_2_3
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Image quantization

%%
% manually quantization
A = imread('lenna512.bmp');
quant_lev = 16;

figure(1)
imshow(A);
title('Original image');
imwrite(A, '.\Task-2-3\original.jpg');

A_1 = uint8(floor(A ./ 16));
figure(2)
imshow(A_1, gray(16));
title('Naive quatization');
imwrite(A_1, gray(16), '.\Task-2-3\naive_quant.png', 'BitDepth', 4);
figure(3)
imhist(A_1, gray(16));
title('Histogram of Naive quatization');

%%
% quantization using MATLAB functions
threshGray = multithresh(A,quant_lev);      % generate multi-threshold
A_2 = imquantize(A, threshGray); % returns quantized matrix ranging (0, 16)
figure(4)
imshow(A_2, gray(16));
title('MATLAB functions used');
imwrite(A_2, gray(16), '.\Task-2-3\matlab_quant.jpg', 'BitDepth', 4);
figure(5)
imhist(A_2, gray(16));
title('Histogram of MATLAB Implementation');


%%
%diff = A_1 - A_2;