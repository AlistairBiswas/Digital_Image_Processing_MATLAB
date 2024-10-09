S = im2double(imread('coins.jpg'));

if size(S, 3) == 3
    S = rgb2gray(S);
end

kernel_size = 5;

half_size = (kernel_size - 1) / 2;

padded_img = padarray(S, [half_size, half_size], 'replicate');

filtered_img = zeros(size(S));

% Apply mean filter
for i = 1:size(S, 1)
    for j = 1:size(S, 2)
        region = padded_img(i:i+kernel_size-1, j:j+kernel_size-1); 
        
        filtered_img(i, j) = mean(region(:));
    end
end

figure;

subplot(1, 2, 1);
imshow(S);
title('Original Image');

subplot(1, 2, 2);
imshow(filtered_img);
title('Mean Filtered Image');