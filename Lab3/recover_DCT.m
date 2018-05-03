%%
% This script is used for EEE330 Lab_3 Task_4
% Author: Ruihao Wang 
% ID: 1405884
% Function to apply inverse DCT to recover images

%%
function rec_im = recover_DCT(dct_im, index, bases)
num_bases = size(index, 1);
N = size(dct_im, 1);
rec_im = zeros(N);
for i=1:num_bases
    coe = dct_im(index(i,1), index(i,2));
    base_mat = bases(:, :, index(i,1), index(i,2));
    rec_im = rec_im + coe * base_mat;
end