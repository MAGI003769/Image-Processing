%

N = 4;

A = dctmtx(N);
A = A';

offset = 5;


basisim = ones(N*(N+offset))*0.5;


B=zeros(N,N,N,N);
for i=1:N
 for j=1:N
   B(:,:,i,j)=A(:,i)*A(:,j)';
   %max(max(B(:,:,i,j)))-min(min(B(:,:,i,j)))   
 end; 
end;
 

for i=1:N
for j=1:N
minb = min(min(B(:,:,i,j)));
maxb = max(max(B(:,:,i,j)));
rangeb = maxb - minb;

if rangeb == 0
    minb =0;
    rangeb = maxb;
end;

imb = B(:,:,i,j) - minb;
imb = imb/rangeb;

iindex1 = (i-1)*N + i*offset-1;
iindex2 = iindex1 + N -1;

jindex1 = (j-1)*N + j*offset -1;
jindex2 = jindex1 + N -1;

basisim(iindex1: iindex2, jindex1:jindex2) = imb;
end;
end;


figure(1)
imshow(basisim)

figure(2)
dispbasisim = imresize(basisim,4,'bilinear');
imshow(dispbasisim);