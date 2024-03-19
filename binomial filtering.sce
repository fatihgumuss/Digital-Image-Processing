clc
clear
close(winsid())

Iin = imread('.\Lena.bmp');
[row col deep]=size(Iin);
Iin=double(Iin);

imshow(uint8(Iin));
Iout=Iin;
N=1
M=[1 2 1;
    2 4 2;
    1 2 1]
for r=1+N:row-N
    for c=1+N:col-N
        for d=1:deep
            p_sum=0
            
            for rr=-N:N
                for cc=-N:N
                    p_sum=p_sum+Iout(r+rr,c+cc,d)*M(rr+N+1,cc+N+1);
                end
            end
            Iout(r,c,d)=p_sum/sum(M)
        end
    end;
end;
sleep(500);
imshow(uint8(Iout));
