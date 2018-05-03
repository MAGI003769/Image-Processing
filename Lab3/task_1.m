%%
% This script is used for EEE330 Lab_3 Task_1
% Author: Ruihao Wang 
% ID: 1405884
% fft and DCT

%%
% Plot vector x = [1:256]
x = linspace(1, 256, 256);
figure(1)
plot(x)
title('x[1:256]')


% Apply DFT and DCT to x
X_f = fft(x);
X_f = fftshift(X_f);
X_c = dct(x);

%%
% Evaluate FFT
steps = 32:32:224;
psnr_f = zeros(1, length(steps));
figure(2)
plot(x)
hold on;
for i=1:length(steps)
    temp_fft = [zeros(1,steps(i)/2) X_f(steps(i)/2+1:end-steps(i)/2) zeros(1,steps(i)/2)];
    temp_recover = abs(ifft(temp_fft));
    plot(temp_recover);
    psnr_f(i) = psnr(temp_recover, x);
end
saveas(gcf, './Task-1/1D_DFT.jpg')

%%
% Evaluate DCT
psnr_c = zeros(1, length(steps));
figure(3)
plot(x)
hold on;
for i=1:length(steps)
    temp_dct = [X_c(1:256-steps(i)) zeros(1,steps(i))];
    temp_recover = idct(temp_dct);
    plot(temp_recover);
    psnr_c(i) = psnr(temp_recover, x);
end
saveas(gcf, './Task-1/1D_DCT.jpg')
    