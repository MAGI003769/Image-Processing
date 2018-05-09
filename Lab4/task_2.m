%%
% This script is for EEE330 Lab 4 
% Task 1: Decompression and recover image
% Author: Ruihao Wang

%%
% Paramters to pass into function
N = 8;
QP = 50;

% Generate Qmat matrix
n = floor(log2(N+1)):-1:0;
Q_mat = zeros(N) + 2^n(1);
for i=n(1:end-1)
    Q_mat(1:2^i-1, 1:2^i-1) = 2^(i-1);
end

%%
% Decompress from stored coded variable
file_name = 'coded_vector';
imo = decompress_im(Q_mat, QP, N, file_name);