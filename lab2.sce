clc
clear
close(winsid())

Iin = imread('.\Lena.bmp');
[row col deep]=size(Iin);
Iin=double(Iin);

M1 = [-1 0 1; 
      -1 0 1;
      -1 0 1];
M2 = [1 1 1; 
      0 0 0;
      -1 -1 -1];
for i = 1:row 
    for j = 1:col
        red= Iin(i,j,1)
        green= Iin(i,j,2)
        blue= Iin(i,j,3)
        grayscale= (red + green + blue) / 3
        Iout(i,j,1) = grayscale
        Iout(i,j,2) = grayscale
        Iout(i,j,3) = grayscale
    end
end
Iout_M1 = zeros(row, col);
Iout_M2 = zeros(row, col);
for i = 2:row-1
    for j = 2:col-1
        Iout_M1(i,j) = sum(sum(Iin(i-1:i+1,j-1:j+1).*M1))
        
        Iout_M2(i,j) = sum(sum(Iin(i-1:i+1,j-1:j+1).*M2))
    end
end


Iout_M1 = -abs(Iout_M1);
Iout_M2 = -abs(Iout_M2);
Iout_M1 = (Iout_M1 - min(Iout_M1(:))) / (max(Iout_M1(:)) - min(Iout_M1(:))) * 255;
Iout_M2 = (Iout_M2 - min(Iout_M2(:))) / (max(Iout_M2(:)) - min(Iout_M2(:))) * 255;
Iout = min(Iout_M1, Iout_M2);
threshold = 190
for i = 1:row
    for j = 1:col
        if Iout(i,j) > threshold
            Iout(i,j) = 255
        else
            Iout(i,j) = 0
        end
    end
end
imshow(uint8(Iout_M1));
figure;
imshow(uint8(Iout_M2));
figure;
imshow(uint8(Iout));
