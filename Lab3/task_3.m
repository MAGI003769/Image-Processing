%%
% This script is used for EEE330 Lab_3 Task_3
% Author: Ruihao Wang 
% ID: 1405884
% Design a filter in frequency domain to remove 'fence' in image

%%
% Read `fence.jpg` and get its shape
a = imread('fence.jpg');
%a = rgb2gray(a);
[M, N, c] = size(a);
figure(1)
imshow(a)
title('Original image with fence')
% Apply 2D fft and normalize the value to visualize
A = fft2(a);
A = fftshift(A);
A_abs = abs(A);
A_abs = (A_abs-min(A_abs(:)))/max(A_abs(:)) * 256;
figure(2)
imshow(A_abs)
title('Visualized fft results')

%%
% Frequency filter design
u0 = 500;
u = 0:(M-1);
v = 0:(N-1);
x_ind = find(u>M/2);
y_ind = find(v>N/2);
u(x_ind) = u(x_ind) - M;
v(y_ind) = v(y_ind) - N;
[V, U] = meshgrid(v, u);
H = zeros(M, N);
for i=1:M
    for j=1:N
        UVw = double(U(i,j)*U(i,j) + V(i,j)*V(i,j))/(u0*u0);
        H(i,j)=1/(1+UVw*UVw);
    end
end
m = linspace(-1, 1, M);
n = linspace(-1, 1, N);
H = fftshift(H);
contour(H,'ShowText','on')

%%
% Filtering in frequency domain
filtered = zeros(M,N,c);
for i=1:c
    filtered_i = A(:,:,1).*H;
    filtered(:,:,i) = filtered_i;
end
recover_img = abs(ifft2(filtered));
for i = 1:c
    recover_img = (recover_img - min(min(recover_img(:,:,i)))) / max(max(recover_img(:,:,i))) * 256;
end
imshow(recover_img);