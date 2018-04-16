%%
% This script is used for interpolation reimplementation
% Author: Ruihao Wang 
% ID: 1405884

%%
function resized = bilinear_re(im, out_dims)

% Get i/o images' dimension
in_row = size(im,1);
in_col = size(im,2);
out_row = out_dims(1);
out_col = out_dims(2);

% Make a grid for output images
% Coordinate pairs
[rf, cf] = meshgrid(1:out_row, 1:out_col);

% Calculate the ratio of two sizes
s_r = in_row / out_row;
s_c = in_col / out_col;

% Project grid to input image
rf = rf * s_r;
cf = cf * s_c;

% Get integer part
r = floor(rf);
c = floor(cf);

% Any values out of range, tailored
r(r < 1) = 1;
c(c < 1) = 1;
r(r > in_row - 1) = in_row - 1;
c(c > in_col - 1) = in_col - 1;

% Delta distance
delta_r = rf - r;
delta_c = cf - c;

% Convert coordinates to equivalent linear index
in1_ind = sub2ind([in_row, in_col], r, c);
in2_ind = sub2ind([in_row, in_col], r+1,c);
in3_ind = sub2ind([in_row, in_col], r, c+1);
in4_ind = sub2ind([in_row, in_col], r+1, c+1);

% Interpolation for each channel
resized = zeros(out_row, out_col, size(im, 3));
resized = cast(resized, class(im)); % match the data type

for channel = 1:size(im,3)
    chan = double(im(:,:,channel));
    estimate = chan(in1_ind).*(1 - delta_r).*(1 - delta_c) + ...
               chan(in2_ind).*(delta_r).*(1 - delta_c) + ...
               chan(in3_ind).*(1 - delta_r).*(delta_c) + ...
               chan(in4_ind).*(delta_r).*(delta_c);
    resized(:,:,channel) = cast(transpose(estimate), class(im));
end



