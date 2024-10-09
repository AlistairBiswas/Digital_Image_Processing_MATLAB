I = imread('BW-Rose.jpg');
I = rgb2gray(I);

figure; imshow(I);

[row, col] = size(I);

R = uint8(zeros(row,col));

for i = 1:row
    for j = 1:col
        R(i,j) = 255 - I(i,j);
    end
end

figure; imshow(R);