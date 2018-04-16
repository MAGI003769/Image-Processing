%%
% This script is used for EEE330 Lab_2 Task_2
% Author: Ruihao Wang 
% ID: 1405884
% Contents: Plot piecwise function

%%
function piecewise_plot(thresh)

% Breakpoints
x1 = thresh(1);
y1 = thresh(2);
x2 = thresh(3);
y2 = thresh(4);

% Get 3 slope values
k1 = y1 / x1;
k2 = (y2 - y1) / (x2 - x1);
k3 = (255 - y2) / (255 - x2);

% Define 3 ranges
r1 = 0:1:x1;
r2 = x1+1:1:x2;
r3 = x2+1:1:255;

% Get linear functions
f1 = floor(k1 * r1);
f2 = floor(y1 + k2 * (r2-x1));
f3 = floor(y2 + k3 * (r3-x2));
f = [f1 f2 f3];

% plot the piecewise 
plot(f);
grid();
xlabel('Input Intensity');
ylabel('Output Intensity')
ylim([0 255]);
xlim([0 255]);