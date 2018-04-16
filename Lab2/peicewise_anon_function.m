%%
% This script is used for EEE330 Lab_2 Task_2
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Task 3 with anonymous function

%%
function im_new = peicewise_anon_function(im, thresh)
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

f = @(x) [k1*(x<=x1), k2*((x>x1&x<x2)-x1) + y1 , k3*((x>=x2)-x2)+ y2];
[row, col] = size(im);
im_new = zeros([row, col]);
for i=1:row
    for j=1:col
        im_new(i,j) = f(im(i,j));
    end
end
im_new = sum(im_new, 3);
im_new = cast(im_new, 'uint8');
        