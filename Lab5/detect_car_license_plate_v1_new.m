function [str] = detect_car_license_plate_v1_new(im, char_list)
% Create a list of eroded templates
templates = cell(36,1);
SE = strel('square', 3);
for i=1:36
    file_name = strcat('./single_char_bbox/template_', char_list(i), '.bmp');
    template_char = (imread(file_name)>0);
    templates{i,1} = imerode(template_char, SE);
end

% Crop detected char from license
s1 = regionprops(im,'BoundingBox');
BoundingBox = cat(1, s1.BoundingBox);
BoundingBox = floor(BoundingBox);
BoundingBox(:, 3) = BoundingBox(:, 3)+1;
BoundingBox(:, 4) = BoundingBox(:, 4)+1;
% Discard regions from Chinese character
detect_len = size(BoundingBox, 1) - 4;
result_list = cell(detect_len, 1);
    
for i=5:(detect_len+4)
    matched = zeros(1,36);
    temp_detect = im(BoundingBox(i,2):BoundingBox(i,2)+BoundingBox(i,4),...
                     BoundingBox(i,1):BoundingBox(i,1)+BoundingBox(i,3));
    temp_detect = padarray(temp_detect,[3 3],0,'both');
    for j=1:36
        temp_SE = strel('arbitrary', templates{j,1});
        temp_result = imerode(temp_detect, temp_SE);
        temp_result = bwmorph(temp_result, 'shrink', Inf);
        if sum(temp_result(:)) ~= 0
            matched(j) = j;
            break;
        end
    end
    result_list{i-4,1} = matched(matched>0);
end
result = cell2mat(result_list);
str = strcat('The license is ку', char_list(result));





