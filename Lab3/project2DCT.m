%%
% This script is used for EEE330 Lab_3 Task_4
% Author: Ruihao Wang 
% ID: 1405884
% Function to do 2D-DCT and return the bases

%%
function [im_DCT, DCT_bases] = project2DCT(im)
T = dctmtx(size(im, 1));
im_DCT = T * im * T';
% ONLY return the linear index of bases (column first)
[rows, cols] = find(abs(im_DCT)>1e-15);
DCT_bases = [rows cols];