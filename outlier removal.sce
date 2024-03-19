clc
clear
close(winsid())

Iin = imread('.\Lena.bmp');
[row col deep]=size(Iin);
Iin=double(Iin);

imshow(uint8(Iin));
Iout = Iin;
N = 1;
threshold = 100;

for r = 1+N:row-N
    for c = 1+N:col-N
        for d = 1:deep
            p_sum = 0;
            count = 0;
            
            for rr = -N:N
                for cc = -N:N
                    if abs(Iout(r,c,d) - Iout(r+rr,c+cc,d)) > threshold
                        continue;
                    end
                    p_sum = p_sum + Iout(r+rr,c+cc,d);
                    count = count + 1;
                end
            end
            
            Iout(r,c,d) = p_sum / count;
        end
    end;
end;
sleep(500);
imshow(uint8(Iout));





