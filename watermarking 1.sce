clc
clear
close(winsid())
Iin = imread('.\Lena.bmp');
[row col deep]=size(Iin);
Iin = double(Iin); 
mask = imread('.\mask.bmp')
mask = double(mask)
monarch = imread('.\Monarch.bmp')
monarch = double(monarch)
coef=0.25
for i=1:row
    for j=1:col
        for k=1:deep
        if mask(i, j,1) == 0
            Iout(i, j,k) = (1-coef) * Iin(i, j, k) +coef*monarch(i, j, k)
        else
            Iout(i,j,k) = double(Iin(i,j,k))
            end
        end
    end
end
sleep(500);
imshow(uint8(Iout));
