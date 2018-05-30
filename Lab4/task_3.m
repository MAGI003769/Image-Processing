%%
% This function is for EEE330 Lab 4 
% Task 3: Compare different outcomes
% Author: Ruihao Wang

clc;
clear;

%%
% Paramters to pass into function
N = 8;
QP = linspace(1,99,8);
file_name = 'coded_vector';
rate = zeros(size(QP));
PSNR = zeros(size(QP));

% Generate Qmat matrix
% n = floor(log2(N+1)):-1:0;
% Q_mat = zeros(N) + 2^n(1);
% for i=n(1:end-1)
%     Q_mat(1:2^i-1, 1:2^i-1) = 2^(i-1);
% end

Qmat = [16 11 10 16 24 40 51 61; ... 
        12 12 14 19 26 58 60 55; ...
        14 13 16 24 40 57 69 56; ...
        14 17 22 29 51 87 80 62; ...
        18 22 37 56 68 109 103 77; ...
        24 35 55 64 81 104 113 92; ...
        49 64 78 87 103 121 120 101; ...
        72 92 95 98 112 100 103 99];

%%
% Read raw image and compress
I = imread('lenna512.bmp');

%%
for i=1:length(QP)
    temp_rate = compress_im(I, Qmat, QP(i), N, file_name);
    temp_imo = decompress_im(Qmat, QP(i), N, file_name);
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