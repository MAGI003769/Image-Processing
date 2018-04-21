%%
% This script is used for EEE330 Lab_3 Task_4
% Author: Ruihao Wang 
% ID: 1405884
% Function to generate 4*4 images of 2D-DCT
% Reference: Anonymous function
% https://ww2.mathworks.cn/help/matlab/matlab_prog/anonymous-functions.html

%%
function bases = generate_DCT(N)
bases = zeros(N, N, N, N);
T = dctmtx(N);
T = T';
for i=1:N
    for j=1:N
        bases (:,:,i,j) = T(:,i)*T(:,j)';
    end
end

% Normalize the bases for visualization
for i=1:N
    for j=1:N
        tmp_bs = bases(:,:,i,j);
        min_b = min(tmp_bs(:));
        max_b = max(tmp_bs(:));
        range_b = max_b - min_b;
        if range_b == 0
            min_b = 0;
            range_b = max_b;
        end
        tmp_bs = (tmp_bs - min_b) / range_b;
        bases(:,:,i,j) = tmp_bs ;
    end
end
        