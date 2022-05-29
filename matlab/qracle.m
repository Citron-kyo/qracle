clc;
clear;
size=256;   %% 32,64,128,256,512,1024,2048
roll=size^2/1024;
rollm=roll;
rollm(rollm>1024)=1024;
C=zeros(rollm,1024);
rnd=[];
url=['https://qrng.anu.edu.au/API/jsonI.php?length=',int2str(rollm),'&type=hex16&size=1024'];
for i=1:1:ceil(roll/1024)
    rnd=[rnd;cell2mat(webread(url).data)];
end
for i=1:1:1024
    C(:,i)=hex2dec(rnd(:,(2*i-1):(2*i)));
end
D=reshape(C,size,size);
I=mat2gray(D);
imshow(I);