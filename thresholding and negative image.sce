clc
clear
close(winsid())

Iin = imread('.\Lena.bmp');
[row col deep]=size(Iin);
Iin=double(Iin);

imshow(uint8(Iin));
Iout=Iin;
for r=1:row
    for c=1:col
        for d=1:deep
            Iout(r, c, d) = 255 - Iin(r, c, d);
        end;
    end;
end;

threshold = 127;
for r = 1:row
    for c = 1:col
        for d = 1:deep
            if Iout(r, c, d) < threshold
                Iout(r, c, d) = 0;
            else
                Iout(r, c, d) = 255;
            end
        end
    end
end
sleep(500);
imshow(uint8(Iout));
