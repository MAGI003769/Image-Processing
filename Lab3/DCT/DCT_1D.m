%%
% This script is used for understanding DCT
% Author: Ruihao Wang 
% ID: 1405884
% 1D DCT

%%
% Time/Spatial Domain Signal, a 8-length sequence
x = ones(1, 8) * 100;
D = dct(x);
figure
subplot(121)
stem(x)
title('Original')
subplot(122)
stem(D)
title('DCT expression')

%%
% Compute bases with function dctmtx
bases = dctmtx(8);
sum_ = sum(bases, 2);
t = 0:0.25:8;

figure
subplot(2, 4, 1)
for i=1:8
    subplot(2, 4, i)
    base_temp = reshape([bases(i,:); zeros(size(bases(i,:))); zeros(size(bases(i,:))); zeros(size(bases(i,:)))], [], 1);
    stem(t(1:end-1), base_temp)
    hold on
    env = sqrt(2/8) * cos((2*t+1)*pi*(i-1)/(2*8));
    if i==1
        env = sqrt(1/8) * cos((2*t+1)*pi*(i-1)/(2*8));
    end
    plot(t, env, 'r')
end
hold off
%%
% Construct DCT from bases
D1 = bases*x'; 
figure
subplot(311)
title('Original')
stem(x)
subplot(312)
stem(D)
title('DCT expression')
subplot(313)
stem(D1)
title('DCT expression from bases')

