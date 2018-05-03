%%
% This script is used for EEE330 Lab_3 Task_2
% Author: Ruihao Wang 
% ID: 1405884
% Contents: 2D-fft of images

%%
% Run gieven code
width = 256;
N = width/16;
n = (1:width) - 1;
x = 1+cos(2*pi*n/N);
im = ones(width, 1)*x;  % matrix multiplicaiton [m, n]*[n, m]->[m, m]
figure(1)
imshow(im)
imwrite(im, '.\Task-2\N_16.jpg');
% Display the log of magnitude result of 2D-DFT
Im = log(abs(fft2(im)));
Im_shift = fftshift(Im);
figure(2)
subplot(121)
imshow(Im)
title('Result of fft')
subplot(122)
imshow(Im_shift)
title('Result after fftshift')
imwrite(Im, '.\Task-2\fft2_16.jpg')
imwrite(Im_shift, '.\Task-2\fftshift_16.jpg')

%%
% Change N from 16 to 8 and repeat fft process
width = 256;
N = width/8;
n = (1:width) - 1;
x = 1+cos(2*pi*n/N);
im = ones(width, 1)*x;  % matrix multiplicaiton [m, n]*[n, m]->[m, m]
figure(3)
imshow(im)
imwrite(im, '.\Task-2\N_8.jpg');
% Display the log of magnitude result of 2D-DFT
Im = 100*log(abs(fft2(im)));
Im_shift = fftshift(Im);
figure(4)
subplot(121)
imshow(Im)
title('Result of fft')
subplot(122)
imshow(Im_shift)
imwrite(Im, '.\Task-2\fft2_8.jpg')
imwrite(Im_shift, '.\Task-2\fftshift_8.jpg')

%%
% Change the computation of x: composed by two cosine wave
width = 256;
N = width/8;
n = (1:width) - 1;
x = 1+cos(2*pi*n/N)+cos(4*pi*n/N);
im = ones(width, 1)*x;  % matrix multiplicaiton [m, n]*[n, m]->[m, m]
figure(5)
imshow(im)
imwrite(im, '.\Task-2\composed.jpg');
% Display the log of magnitude result of 2D-DFT
Im = 100*log(abs(fft2(im)));
Im_shift = fftshift(Im);
figure(6)
subplot(121)
imshow(Im)
title('Result of fft')
subplot(122)
imshow(Im_shift)
title('Result after fftshift')
imwrite(Im, '.\Task-2\fft2_composed.jpg')
imwrite(Im_shift, '.\Task-2\fftshift_composed.jpg')


