img = imread('BW-Rose.jpg');
img = rgb2gray(img);


[rows, cols] = size(img);

transformed_img = img;

for i = 1:rows
    for j = 1:cols
        if j <= cols - i + 1
            transformed_img(i, j) = 255 - img(i, j);
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
