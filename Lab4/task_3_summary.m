%%
% This function is for EEE330 Lab 4 
% Task 2: Image decompression
% Author: Ruihao Wang

clc;
clear;

% Read original image
I = imread('lenna512.bmp');
QP = linspace(1, 99, 8);

% Load rate and PSNR of N=8,16 for summary
load('rate_N_8.mat');
rate_8 = rate;
load('rate_N_16.mat');
rate_16 = rate;

load('PSNR_N_8.mat');
psnr_8 = PSNR;
load('PSNR_N_16.mat');
psnr_16 = PSNR;

psnr_jpg = zeros(size(QP));
rate_jpg = zeros(size(QP));
% Compress images with imwrite
for j=1:length(QP)
    file_name = strcat('./JEPG_results/compression_QP_', num2str(QP(j)), '.jpg');
    imwrite(I, file_name, 'Quality', QP(j));
    temp_jpg = imread(file_name);
    temp_rate = fsize(file_name)*8 / size(I, 1)^2;
    psnr_jpg(j) = psnr(temp_jpg, I);
    rate_jpg(j) = temp_rate;
end

% Plot RD curve for summary
figure
plot(rate_8, psnr_8, '-or', 'linewidth', 1.2);
hold on
plot(rate_16, psnr_16, '-og', 'linewidth', 1.2);
plot(rate_jpg, psnr_jpg, '-ob', 'linewidth', 1.2);
hold off
legend('N=8', 'N=16', 'JPEG', 'Location', 'southeast');
xlabel('Bit Rate')
ylabel('PSNR')
grid()
saveas(gcf, 'task_3_summary.png');






