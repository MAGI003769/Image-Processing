%%
% This function is for EEE330 Lab 4 
% Task 2: Image decompression
% Author: Ruihao Wang

clc;
clear;

%%
% Paramters to pass into function
N = 16;
QP = linspace(1,99,8);
file_name = 'coded_vector';
rate = zeros(size(QP));
PSNR = zeros(size(QP));

% Generate Qmat matrix
n = floor(log2(N+1)):-1:0;
Q_mat = zeros(N) + 2^n(1);
for i=n(1:end-1)
    Q_mat(1:2^i-1, 1:2^i-1) = 2^(i-1);
end

%%
% Read raw image and compress
I = imread('lenna512.bmp');

%%
for i=1:length(QP)
    temp_rate = compress_im(I, Q_mat, QP(i), N, file_name);
    temp_imo = decompress_im(Q_mat, QP(i), N, file_name);
    temp_psnr = psnr(temp_imo, I);
    rate(i) = temp_rate;
    PSNR(i) = temp_psnr;
end

%%
% Plot PSNR versus bit rate curve
figure
plot(rate, PSNR, '-ob', 'linewidth', 1.5);
xlabel('Bit Rate')
ylabel('PSNR')
grid()
saveas(gcf, strcat('PSNR_bit_rate_N_', num2str(N), '.png'));

%%
% Save obtained data
save(strcat('PSNR_N_', num2str(N), '.mat'), 'PSNR');
save(strcat('rate_N_', num2str(N), '.mat'), 'rate');