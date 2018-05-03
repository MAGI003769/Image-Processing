%%
% This is for EEE330 Lab 4
% Image compression
% Task 1

%%
% Generate Qmat matrix
N = 8;
n = floor(log2(N+1)):-1:0;
Q_mat = zeros(N) + 2^n(1);
count = 0;
for i=n(1:end-1)
    Q_mat(1:2^i-1, 1:2^i-1) = 2^(i-1);
    count = count + 1;
end

%%

