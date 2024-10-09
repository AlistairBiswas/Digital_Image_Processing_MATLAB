I = imread('BW-Rose.jpg');
I = rgb2gray(I);
I = im2double(I);

[rows, cols] = size(I);

R = I;

c = 3; 

for i = 100:row-100
    for j = 1:col-100
        if j <= (row - i - 100) * (col - 100) / (row - 200)
            R(i, j) = c * log(I(i, j) + 1);
        end
    end
end

figure;
subplot(1, 2, 1);
imshow(I);
title('Original Image');

subplot(1, 2, 2);
imshow(R);
title('Transformed Image');