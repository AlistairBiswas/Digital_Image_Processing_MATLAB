I = imread('shapes.jpg');
if size(I, 3) == 3
    I = rgb2gray(I);
end

sigma = input('Enter the value of sigma: ');

ID = 46;
rem = mod(ID, 4);

if rem == 0
    kernel_size = 3;
elseif rem == 1
    kernel_size = 5;
elseif rem == 2
    kernel_size = 7;
elseif rem == 5
    kernel_size = 11;
end

half_size = (kernel_size - 1) / 2;
x = zeros(kernel_size, kernel_size);
y = zeros(kernel_size, kernel_size);

for i = 1:kernel_size
    for j = 1:kernel_size
        y(i, j) = (i - 1) - half_size;
        x(i, j) = (j - 1) - half_size;
    end
end

kernel = (1 / (2 * pi * sigma^2)) * exp(-(x.^2 + y.^2) / (2 * sigma^2));
kernel = kernel / sum(kernel(:));

% padding
padded_img = zeros(size(I) + 2 * half_size);
padded_img(half_size + 1:end - half_size, half_size + 1:end - half_size) = double(I);

filtered_img = zeros(size(I));

[rows, cols] = size(I);
for i = 1:rows
    for j = 1:cols
        region = double(padded_img(i:i+kernel_size-1, j:j+kernel_size-1)); 
        filtered_img(i, j) = sum(sum(region .* kernel));
    end
end

figure;
subplot(1, 2, 1)
imshow(I)
title('Original Image');

subplot(1, 2, 2)
imshow(uint8(filtered_img))
title('Filtered Image');

imwrite(I, 'original_image.png');
imwrite(uint8(filtered_img), 'filtered_image.png');
