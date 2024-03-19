clc
clear
close(winsid())
Iin = imread('.\image.bmp');
[row col deep]=size(Iin);
Iin = double(Iin); 
mask = imread('.\mask.bmp')
mask = double(mask)
monarch = imread('.\Monarch.bmp')
monarch = double(monarch)
[monRow monCol monDeep]=size(monarch)
startRow=row-monRow
startCol=col-monCol
coef=0.25
Iout = zeros(row, col, deep);
for i = 1:startRow
    for j = 1:startCol
        for k = 1:deep
            if(i<=monRow & j<=monCol)
                if mask(i, j, 1) == 0
                    Iout(i, j, k) = (1 - coef) * Iin(i, j, k) + coef * monarch(i, j, k);
                else
                    Iout(i, j, k) = double(Iin(i, j, k));
                end
             else
                 Iout(i, j, k) = double(Iin(i, j, k));
            end
        end
    end
end

for i = startRow+1:row
    for j = 1:startCol
        for k = 1:deep
            Iout(i, j, k) = Iin(i, j, k);
        end
    end
end

for i = 1:row
    for j = startCol+1:col
        for k = 1:deep
            Iout(i, j, k) = Iin(i, j, k);
        end
    end
end

sleep(500);
imshow(uint8(Iout));
