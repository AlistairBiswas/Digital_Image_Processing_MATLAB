I = imread('BW-Rose.jpg');
I = rgb2gray(I);

I = im2double(I);

figure; imshow(I);

[row, col] = size(I);

R = double(zeros(row,col));

c = 1;
gamma = 0.2;

for i = 1:row
    for j = 1:col
        R(i,j) = c * power(I(i, j), gamma);
    end
end

figure; imshow(R);