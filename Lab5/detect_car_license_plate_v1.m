function [str] = detect_car_license_plate_v1(im, char_list, ero)
% Create structure elements for each single char and detect
detect_char = cell(36,1);
SE = strel('square', ero);
for i=1:length(char_list)
    file_name = strcat('./single_char_bbox/template_', char_list(i), '.bmp');
    char_img = (imread(file_name)>0);
    char_img = imerode(char_img, SE);
    char_SE = strel('arbitrary', char_img);
    im_out = imerode(im, char_SE);
    im_out = bwmorph(im_out, 'shrink', Inf);
    if sum(im_out(:)) ~= 0
        [row,col] = find(im_out);
        detect_char{i}(:) = min(col);
        detect_char{i}(end+1) = i;
    end
end
index = find(~cellfun('isempty', detect_char));
detect_char = detect_char(index,1);
char_array = cell2mat(detect_char);
char_array = sortrows(char_array, 1);
str = strcat('The license is ку', char_list(char_array(:,end)));