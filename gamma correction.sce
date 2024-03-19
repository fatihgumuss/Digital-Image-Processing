clc
clear
close(winsid())

Iin = imread('.\Lena.bmp');
[row col deep]=size(Iin);
Iin=double(Iin);

imshow(uint8(Iin));
Iout=Iin;
gammaRed=1.5
gammaGreen=1.5
gammaBlue=1.5
    //for red
    for c=1:col
        for r=1:row
            Iout(r,c,1) = 255*((Iout(r,c,1)/255)^gammaRed)
        end
    end;
    //for blue
    for c=1:col
        for r=1:row
            Iout(r,c,2) = 255*((Iout(r,c,2)/255)^gammaGreen)
        end
    end;
    //for green
    for c=1:col
        for r=1:row
            Iout(r,c,3) = 255*((Iout(r,c,3)/255)^gammaBlue)
        end
    end;
sleep(500);
imshow(uint8(Iout));
