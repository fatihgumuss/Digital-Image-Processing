clc
clear
close(winsid())

RT = imread('.\RT.bmp');
[row col]=size(RT);

matrix = ones(3, 3);

function Iout = dilation(RT)
    Iout = zeros(row, col);
    for r = 2:row-1
        for c = 2:col-1
            result = [matrix(1)*RT(r-1,c-1), matrix(2)*RT(r-1,c), matrix(3)*RT(r-1,c+1),
            matrix(4)*RT(r,c-1), matrix(5)*RT(r,c), matrix(6)*RT(r,c+1),
            matrix(7)*RT(r+1,c-1), matrix(8)*RT(r+1,c), matrix(9)*RT(r+1,c+1)];
            Iout(r,c) = min(result);
        end
    end
endfunction
figure
title("Dilation = ~E(~image)")
imshow(dilation(RT))

function Iout = erosion(RT)
    Iout = zeros(row, col);
    RT_n=255 - RT
    RT=RT_n
    for r = 2:row-1
        for c = 2:col-1
            result = [matrix(1)*RT(r-1,c-1), matrix(2)*RT(r-1,c), matrix(3)*RT(r-1,c+1),
            matrix(4)*RT(r,c-1), matrix(5)*RT(r,c), matrix(6)*RT(r,c+1),
            matrix(7)*RT(r+1,c-1), matrix(8)*RT(r+1,c), matrix(9)*RT(r+1,c+1)];
            Iout(r,c) = min(result);
        end
    end
    Iout = 255 - Iout
endfunction
figure
title("Erosion")
imshow(erosion(RT))

function Iout = closing(RT)
    Iout = dilation(RT)
    Iout = erosion(Iout)
endfunction

Iout = closing(RT)
figure
title("Closing = C=E(D(image))")
imshow(Iout)
closing(Iout)
figure
title("Closing applied to the image twice")
imshow(Iout)

function Iout = opening(RT)
    Iout = erosion(RT)
    Iout = dilation(Iout)
endfunction
figure
title("Opening = O=D(E(image))")
imshow(opening(RT))

function Iout = border_detection(RT)
    RT = double(RT);
    eroded = uint8(erosion(RT));
    Iout = RT - eroded;
endfunction

figure
title("Border detection");
imshow(border_detection(RT));
