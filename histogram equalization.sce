clc
clear
close(winsid())

Iin = imread('.\Image_LC.bmp');
[row col deep]=size(Iin);
Iin=double(Iin);

imshow(uint8(Iin));
Iout=Iin;
hist = zeros(1,256)
for r=1:row
    for c=1:col
        gray = (Iin(r,c,1)+Iin(r,c,2)+Iin(r,c,3))/3;
        value = gray
        Iout(r,c,1)=value
        Iout(r,c,2)=value
        Iout(r,c,3)=value
        hist(gray+1)=hist(gray+1)+1
    end;
end;
CH = zeros(1,256)
CH(1)=hist(1)
for i=2:256
        CH(i)=CH(i-1)+hist(i)
    end
for r=1:row
    for c=1:col
        gray = (Iin(r,c,1)+Iin(r,c,2)+Iin(r,c,3))/3;
        Iout(r,c,1) = (255 * CH(gray+1)) / CH(256);
        Iout(r,c,2)=Iout(r,c,1)
        Iout(r,c,3)=Iout(r,c,1)
    end
end
sleep(500);
imshow(uint8(Iout));
