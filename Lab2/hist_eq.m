%%
% This script is used for EEE330 Lab_2 Task_3
% Author: Ruihao Wang
% ID: 1405884
% Contents: Evaluate PSNR of different images

%%
function equalized = hist_eq(im, L)
[counts, bins] = imhist(im);
[M, N] = size(im);
equalized = zeros([M,N]);
counts = counts / (M*N);  % normalize the distribution

T = @(x) bins(L) * sum(counts(1:x));

for i=1:M
    for j=1:N
        equalized(i,j) = T(im(i,j));
    end
end    
equalized = cast(equalized, 'uint8');
