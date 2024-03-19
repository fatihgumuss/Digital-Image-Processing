clc
clear
close(winsid())
Iin1 = imread('.\Lena.bmp');
Iin2 = imread('.\Monarch.bmp');

Iin1 = double(Iin1);
Iin2 = double(Iin2);

a = 0.65;
b = 0.35;
Iout = a*Iin1 + b*Iin2;

imshow(uint8(Iin1));
imshow(uint8(Iout));
