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
            //Iout(r,c,d)=Iin(r,c,d);
            //Iout(r,c,d)=Iin(c,r,d);
            //Iout(r,c,d)=Iin(r,col-c+1,d);
            //Iout(r,c,d)=Iin(row-r+1,c,d);
            //Iout(r,c,d)=Iin(col-c+1,r,d);
            //Iout(r,c,d)=Iin(c,row-r+1,d);
            //Iout(r,c,d)=Iin(row-r+1,col-c+1,d);
            Iout(r,c,d)=Iin(col-c+1,row-r+1,d);
        end;
    end;
end;
sleep(500);
imshow(uint8(Iout));
