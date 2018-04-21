%%
% This script is used for EEE330 Lab_3 Task_4
% Author: Ruihao Wang 
% ID: 1405884
% Implementation of 2D Zero-padding

%%
function padded = my_padding(img, w, h)
[m, n, c] = size(img);
% Get padding sizes
up_w = floor((w-m)/2);
up_h = floor((h-n)/2);
low_w = ceil((w-m)/2);
low_h = ceil((h-n)/2);
padded = zeros(w, h, c);
for i=1:c
    padded(up_w+1:w-low_w, up_h+1:h-low_h,c) = img(:,:,c);
end


