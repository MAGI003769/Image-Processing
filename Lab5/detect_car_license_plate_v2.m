function [str] = detect_car_license_plate_v2(im, char_list)
% Create a list of BG and FG templates
template_FG = cell(36,1);
template_BG = cell(36,1);

FG_SE = strel('disk', 2, 8);
BG_SE = strel('disk', 3, 8);
for i=1:36
    file_name = strcat('./single_char_bbox/template_', char_list(i), '.bmp');
    template_char = (imread(file_name)>0);
    template_char = padarray(template_char,[3 3],0,'both');
    template_FG{i,1} = imerode(template_char, FG_SE);
    template_BG{i,1} = ~imdilate(template_char, BG_SE);
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
        FG_SE = strel('arbitrary', template_FG{j,1});
        BG_SE = strel('arbitrary', template_BG{j,1});
        temp_result = bwhitmiss(temp_detect, FG_SE, BG_SE);
        temp_result = bwmorph(temp_result, 'shrink', Inf);
        if sum(temp_result(:)) ~= 0
            matched(j) = j;
            break;
        end
    end
    result_list{i-4,1} = matched(matched>0);
end
result = cell2mat(result_list);
str = strcat('The license is ��', char_list(result));