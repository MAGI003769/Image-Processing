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
title('Original')
stem(x)
subplot(122)
stem(D)
title('DCT expression')

%%
% Compute bases with function dctmtx
bases = dctmtx(8);
figure
subplot(2, 4, 1)
for i=1:8
    subplot(2, 4, i)
    stem(bases(i,:))
end

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

