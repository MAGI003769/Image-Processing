%%
% This function is for EEE330 Lab 4 
% Task 1: Image compression
% Author: Ruihao Wang

%%
function [rate] = compress_im(im, Qmat, QP, N, file_name)

% Use quality factor QP to calculate S
if QP>=100 || QP<=0 
    error('QP should be in range from 0 to 100');
    return
elseif QP>50
    S = (100-QP) / 50;
else
    S = 50/QP;
end

Qmat = S * Qmat;

% Apply DCT to N*N block
dct = @(block_struct) dct2(block_struct.data);
%dct = @(block_struct) dct2(block_struct.data);
B = blockproc(im, [N N], dct);
    
% Convert into iteger numbers and quantize each block
quant = @(block_struct) round(block_struct.data ./ Qmat);
B2 = blockproc(B, [N N], quant);

% Zig-zag reordering
zig_zag = @(block_struct) zigzag(block_struct.data);
B2 = blockproc(B2, [N, N], zig_zag);

% Encoding
coded_vector = entropy_enc(B2);
file_p = fopen(file_name, 'w');
fwrite(file_p, coded_vector, 'uint8');

% Evaluate bit rate (bit per pixel)
size_ = fsize(file_name);
rate = size_ * 8 / (size(im,1).^2);

return
