clc
clear
close(winsid())

Iin = imread('.\Lena.bmp');
[row col deep]=size(Iin);
Iin=double(Iin);

imshow(uint8(Iin));

Iout=Iin;
b=-75
con=1.3
for r=1:row
    for c=1:col
        for d=1:deep
            value=con*Iin(r,c,d)+b;
            if value>255
                value=255
            end
            if value<0
                value=0
            end
            Iout(r,c,d)=value
        end;
    end;
end;
sleep(500);
imshow(uint8(Iout));
