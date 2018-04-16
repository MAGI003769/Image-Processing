%%
% This script is used for EEE330 Lab_2 Task_2
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Evaluate PSNR of different images

%%
function im_new = piecewise_mapping(im, thresh)
% Input Arguments
% im: a (n,n,?) array of image to contrast stretching
% threshes: an (4,) array specifies break points

% Breakpoints
x1 = thresh(1);
y1 = thresh(2);
x2 = thresh(3);
y2 = thresh(4);

% Get 3 slope values
k1 = y1 / x1;
k2 = (y2 - y1) / (x2 - x1);
k3 = (255 - y2) / (255 - x2);

% 
index1 = uint8(im <= x1);
index2 = uint8((im > x1)&(im < x2));
index3 = uint8(im >= x2);

% 
im_new1 = index1.*floor(k1*im);
im_new2 = index2.*floor(y1 + k2*(im-x1));
im_new3 = index3.*floor(y2 + k3*(im-x2));

im_new = cast(im_new1+im_new2+im_new3, 'uint8');







