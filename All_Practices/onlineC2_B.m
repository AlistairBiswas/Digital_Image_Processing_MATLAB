I = imread('BW-Rose.jpg');
I = rgb2gray(I);

[rows, cols] = size(I);

R = I;

for i = 1:rows
    for j = 1:cols
        if i<=j
        R(i, j) = 255 - I(i, j);
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
