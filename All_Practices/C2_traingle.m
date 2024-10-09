img = imread('BW-Rose.jpg');
img = rgb2gray(img);


[rows, cols] = size(img);

transformed_img = img;

for i = rows/2:rows - 50
    for j = cols/2:cols - 50
        if j >= cols-50  - i + 1
            if j <= col - 50 - i + 1
            transformed_img(i, j) = 255 - img(i, j);
            end
        end
    end
end

figure;
subplot(1, 2, 1);
imshow(img);
title('Original Image');

subplot(1, 2, 2);
imshow(transformed_img);
title('Transformed Image');