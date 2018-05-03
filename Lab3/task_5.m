%%
% This script is used for EEE330 Lab_3 Task_5
% Author: Ruihao Wang 
% ID: 1405884
% 

%%
% Generate bases of 4*4 image of 2D-DCT and visualize them
N = 4;
[bases, bases_norm] = generate_DCT(4);
gap = 2;
w = N*N+gap*(N+1);
visual_b = ones(w)*0.87;
for i=1:N
    index_1 = i*gap + (i-1)*N + 1;
    for j=1:N
        index_2 = j*gap + (j-1)*N + 1;
        visual_b(index_1:index_1+N-1, index_2:index_2+N-1)=bases_norm(:,:,i,j);
    end
end
visual_b = imresize(visual_b, 10, 'box');
figure(1)
imshow(visual_b)
title('4*4 2D-DCT bases')
imwrite(visual_b, './Task-5/2D-DCT_bases.jpg');

%%
% Project 3 images on basis
img_1 = [1, 0, 0, 0; 1, 0, 0, 0; 1, 0, 0, 0; 1, 0, 0, 0];
img_2 = [0, 0, 0, 0; 1, 1, 1, 1; 0, 0, 0, 0; 0, 0, 0, 0];
img_3 = [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1];
%img_4 = [0, 0, 0, 1; 0, 0, 1, 0; 0, 1, 0, 0; 1, 0, 0, 0];

% Obtain DCT transformed images and index of their required bases
[dct_1, bases_1] = project2DCT(img_1);
[dct_2, bases_2] = project2DCT(img_2);
[dct_3, bases_3] = project2DCT(img_3);

%%
% Apply inverse DCT
rec_img_1 = recover_DCT(dct_1, bases_1, bases);
rec_img_2 = recover_DCT(dct_2, bases_2, bases);
rec_img_3 = recover_DCT(dct_3, bases_3, bases);

%%
figure
subplot(231)
imshow(img_1);
title('Original i')
subplot(232)
imshow(img_2);
title('Original ii')
subplot(233)
imshow(img_3);
title('Original iii')

subplot(234)
imshow(rec_img_1);
title('Recovered i')
subplot(235)
imshow(rec_img_2);
title('Recovered ii')
subplot(236)
imshow(rec_img_3);
title('Recovered iii')

saveas(gcf, './Task-5/compare.jpg');


