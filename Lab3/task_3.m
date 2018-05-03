%%
% This script is used for EEE330 Lab_3 Task_3
% Author: Ruihao Wang 
% ID: 1405884
% Design a filter in frequency domain to remove 'fence' in image

%%
clear
clc

%%
% Read `fence.jpg` and get its shape
a = imread('fence.jpg');
%a = rgb2gray(a);
[M, N, c] = size(a);
figure
imshow(a)
title('Original image with fence')
imwrite(a, './Task-3/origin.jpg')
% Apply 2D fft and normalize the value to visualize
A = fft2(a);
A = fftshift(A);
A_abs = abs(A);
A_abs = log(A_abs);
for i=1:c
    figure
    imshow(A_abs(:,:,1), [])
    write_dir = strcat('./Task-3/fft_image_chan_', num2str(i),'.jpg');
    A_abs(:,:,i) = (A_abs(:,:,i)-min(min(A_abs(:,:,i))))/max(max(A_abs(:,:,i))) * 255;
    imwrite(cast(A_abs(:,:,1), 'uint8'), write_dir);
end

%%
% Frequency filter design
H = ones(M, N);
H(300:320, 1:285) = 1e-15;
H(300:320, N-285+1:N) = 1e-15;
H(1:292, 240:300) = 1e-15;
H(M-285+1:M,N-300+1:N-240+1) = 1e-15;
figure
imshow(H)

%%
% Filtering in frequency domain
filtered = zeros(M,N,c);
%A = fftshift(A);
for i=1:c
    filtered_i = A(:,:,i).*H;
    filtered(:,:,i) = filtered_i;
end
figure
filtered_abs = log(abs(filtered));
for i=1:c
    subplot(1,3,i)
    imshow(filtered_abs(:,:,1),[])
    write_dir = strcat('./Task-3/masked_fft_chan_', num2str(i),'.jpg');
    filtered_abs(:,:,i) = (filtered_abs(:,:,i)-min(min(filtered_abs(:,:,i))))/max(max(filtered_abs(:,:,i))) * 255;
    imwrite(cast(filtered_abs(:,:,1), 'uint8'), write_dir);
end

% filtered = fftshift(filtered);
recover_img = abs(ifft2(filtered));
% filtering
% for i=1:c
%     recover_img(:,:,i) = medfilt2(recover_img(:,:,i));
% end
recover_img = cast(recover_img, 'uint8');
figure
imshow(recover_img);
imwrite(recover_img, './Task-3/fence_removed.jpg')