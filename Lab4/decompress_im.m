%%
% This function is for EEE330 Lab 4 
% Task 2: Image decompression
% Author: Ruihao Wang

%%
function [imo] = decompress_im(Qmat, QP, N, file_name)

% Use quality factor QP to calculate S
if QP>=100 || QP<=0 
    error('QP should be in range from 0 to 100');
    return
elseif QP>50
    S = (100-QP) / 50;
else
    S = 50/QP;
end

Qmat = S*Qmat;

% Load coded vector from local disk
file_p = fopen(file_name, 'r');
coded_vector = fread(file_p, 'uint8');

% Decode vector to matrix
decoded_vector = entropy_dec(coded_vector);
decoded_vector = reshape(decoded_vector, N*N, []);
%M = sqrt(size(decoded_vector, 1));
%B = reshape(decoded_vector, M, M);

% inverse zig-zag
inv_zigzag = @(block_struct) izigzag(block_struct.data, N, N);
B = blockproc(decoded_vector, [1, N*N], inv_zigzag);

% Dequantizaiton
de_quant = @(block_struct) block_struct.data .* Qmat;
B = blockproc(B, [N N], de_quant);

% Inverse 2D-DCT
inv_dct = @(block_struct) idct2(block_struct.data);
imo = blockproc(B, [N N], inv_dct);
imo = cast(imo, 'uint8');

folder = strcat('./Reulsts_N_', num2str(N), '/');
filename = strcat('recover_N', num2str(N), '_QP', num2str(QP),'.jpg');
full_name = strcat(folder, filename);
imwrite(imo, full_name);

return


