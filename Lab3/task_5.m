%%
% This script is used for EEE330 Lab_3 Task_5
% Author: Ruihao Wang 
% ID: 1405884
% 

%%
% Generate bases of 4*4 image of 2D-DCT and visualize them
N = 4;
bases = generate_DCT(4);
gap = 2;
w = N*N+gap*(N+1);
visual_b = ones(w)*0.87;
for i=1:N
    index_1 = i*gap + (i-1)*N + 1;
    for j=1:N
        index_2 = j*gap + (j-1)*N + 1;
        visual_b(index_1:index_1+N-1, index_2:index_2+N-1)=bases(:,:,i,j);
    end
end
visual_b = imresize(visual_b, 10, 'box');
figure(1)
imshow(visual_b)
title('4*4 2D-DCT bases')
imwrite(visual_b, './Task-5/2D-DCT_bases.jpg');

%%
% 

