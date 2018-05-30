%%
% This script is for EEE330 Lab 5
% Lab is about morphological operations
% Task 2: Car License Plate Recognition
% The main function of this script is to crop single chars from template
% and erode original template
% Author: Ruihao Wang

%%
clc;
clear;
char_list = ['A', '0', '5', 'K', 'U', '6',...
             '1', 'B', 'V', 'L', 'W', '2',...
             '7', 'M', 'C', '3', '8', 'X',...
             'D', 'N', '4', '9', 'Y', 'O',...
             'E', 'Z', 'F', 'P', 'G', 'Q',...
             'H', 'R', 'S', 'I', 'J', 'T'];

%%
% Read images and binarize the plate image
char_template = imread('alphanumeric_templates.png');
char_template = rgb2gray(char_template);
max_ = max(char_template(:));
quant = zeros(size(char_template), 'uint8') + max_;
char_template = ~round(char_template ./ quant);

% Read license as reference to compensate mismatch
im_license = imread('car_license_plate.png');
max_ = max(im_license(:));
quant = zeros(size(im_license), 'uint8') + max_;
im_license_bw = round(im_license ./ quant);
im_license_bw = (im_license_bw>0);

%%
% Crop the characters from template
s = regionprops(char_template,'BoundingBox');
BoundingBox = cat(1, s.BoundingBox);
BoundingBox = floor(BoundingBox);
BoundingBox(:, 3) = BoundingBox(:, 3)+1;
BoundingBox(:, 4) = BoundingBox(:, 4)+1;

figure
imshow(char_template);
hold on;
for i=1:size(BoundingBox, 1)
    rectangle('Position',...
              [BoundingBox(i,1), BoundingBox(i,2), BoundingBox(i,3), BoundingBox(i,4)],...
               'EdgeColor', 'r',...
               'LineWidth', 1.5);
end
hold off
saveas(gcf, './Task_2/template_region.jpg');

%%
% Crop the characters from license
s1 = regionprops(im_license_bw,'BoundingBox');
BoundingBox1 = cat(1, s1.BoundingBox);
BoundingBox1 = floor(BoundingBox1);
BoundingBox1(:, 3) = BoundingBox1(:, 3)+1;
BoundingBox1(:, 4) = BoundingBox1(:, 4)+1;

% Calculate the ratio of template and license char
ratio_w = BoundingBox(25, 3) / BoundingBox1(5, 3);
ratio_h = BoundingBox(25, 4) / BoundingBox1(5, 4);

figure
imshow(im_license_bw, []);
hold on;
for j=5:size(BoundingBox1, 1)
    rectangle('Position',...
              [BoundingBox1(j,1), BoundingBox1(j,2), BoundingBox1(j,3), BoundingBox1(j,4)],...
               'EdgeColor', 'r',...
               'LineWidth', 1.5);
end
hold off
saveas(gcf, './Task_2/license_region.jpg');

%%
% Erode template
% SE = strel('square',3);
for i=1:size(BoundingBox, 1)
   file_name = strcat('./single_char_bbox/template_', char_list(i), '.bmp');
   temp_char = char_template(BoundingBox(i,2):BoundingBox(i,2)+BoundingBox(i,4),...
                             BoundingBox(i,1):BoundingBox(i,1)+BoundingBox(i,3));
   %temp_char = imerode(temp_char, SE);
   %temp_char = imresize(temp_char, ratio_w);
   imwrite(temp_char, file_name);
end
