close all
clear all

i = 1:8 % dimension of vector
f(i) = 100% set fucntion

figure(1)  % plot f

stem(f);

% compute DCT
D = dct(f);

figure(2)  % plot D

stem(D);

% illustrate DCT bases

% compute DCT bases with dctmtx

bases = dctmtx(8);

%plot bases:each row(j) of bases is the jth DCT Basis Function

for j = 1 : 8
    figure %increment figure
    stem(bases(j,:));  % plot rows
end


% construct DCT from Basis Functions
% Simply multiply f' (column vector) by bases

D1 = bases*f';  

figure  % plot D1

stem(D1);