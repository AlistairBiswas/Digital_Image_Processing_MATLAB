% Step 1
I = imread('image1.jpg');
figure;
imshow(I, []);
title('Figure (a): Input Image');
I = im2double(I);  % Convert image to double

% Step 2: Apply Laplacian Filter
laplacian_filter = [0 1 0;
                 1 -4 1;
                 0 1 0];
             
[H, W] = size(I);
[filter_h, filter_w] = size(laplacian_filter);

pad_h = floor(filter_h / 2);
pad_w = floor(filter_w / 2);

padded_image = zeros(H + 2 * pad_h, W + 2 * pad_w);
padded_image(pad_h + 1:end - pad_h, pad_w + 1:end - pad_w) = I;

laplacian_filtered_image = zeros(H, W);

for i = 1:H
    for j = 1:W
        region = padded_image(i:i+filter_h-1, j:j+filter_w-1);
        laplacian_filtered_image(i, j) = sum(sum(region .* laplacian_filter));
    end
end

figure;
imshow(laplacian_filtered_image, []);
title('Figure (b): Laplacian Filtered Image');

% Step 3: Laplacian Enhanced Image
laplacian_enhanced_image = I + laplacian_filtered_image;

figure;
imshow(uint8(laplacian_enhanced_image * 255), []);
title('Figure (c): Laplacian Enhanced Image');

% Step 4: Apply Sobel Filter
sobel_x = [-1 0 1;
           -2 0 2;
           -1 0 1];
       
sobel_y = [1 2 1;
           0 0 0;
          -1 -2 -1];
      
sobel_filtered_image_x = zeros(H, W);
sobel_filtered_image_y = zeros(H, W);

for i = 1:H
    for j = 1:W
        region = padded_image(i:i + filter_h - 1, j:j + filter_w - 1);
        sobel_filtered_image_x(i, j) = sum(sum(region .* sobel_x));
    end
end

for i = 1:H
    for j = 1:W
        region = padded_image(i:i + filter_h - 1, j:j + filter_w - 1);
        sobel_filtered_image_y(i, j) = sum(sum(region .* sobel_y));
    end
end

sobel_filtered_image = sqrt(sobel_filtered_image_x .^ 2 + sobel_filtered_image_y .^ 2);

figure;
imshow(uint8(sobel_filtered_image * 255), []);
title('Figure (d): Sobel Filtered Image');

% Step 5: Apply 5x5 Average Filter
average_filter = ones(5, 5) / 25;

[filter_h, filter_w] = size(average_filter);

pad_h = floor(filter_h / 2);
pad_w = floor(filter_w / 2);

padded_image = zeros(H + 2 * pad_h, W + 2 * pad_w);
padded_image(pad_h + 1:end - pad_h, pad_w + 1:end - pad_w) = sobel_filtered_image;

average_filtered_image = zeros(H, W);

for i = 1:H
    for j = 1:W
        region = padded_image(i:i + filter_h - 1, j:j + filter_w - 1);
        average_filtered_image(i, j) = sum(sum(region .* average_filter));
    end
end

figure;
imshow(uint8(average_filtered_image * 255), []);
title('Figure (e): Average Filtered Image');

% Step 6: Product of (c) and (e)
product_image = laplacian_enhanced_image .* average_filtered_image;

figure;
imshow(uint8(product_image * 255), []);
title('Figure (f): Product Image');

% Step 7: Add (a) and (f)
final_image = I + product_image;

figure;
imshow(uint8(final_image * 255), []);
title('Figure (g): Final Image');

% Step 8: Apply Power Law Transform
c = 1;
gamma = 0.5;
power_law_transformed_image = c * (final_image .^ gamma);

figure;
imshow(uint8(power_law_transformed_image * 255), []);
title('Figure (h): Power Law Transformed Image');

% Subplot
figure;
subplot(2, 4, 1); imshow(uint8(I * 255), []); title('Figure (a)');
subplot(2, 4, 2); imshow(laplacian_filtered_image, []); title('Figure (b)');
subplot(2, 4, 3); imshow(uint8(laplacian_enhanced_image * 255), []); title('Figure (c)');
subplot(2, 4, 4); imshow(uint8(sobel_filtered_image * 255), []); title('Figure (d)');
subplot(2, 4, 5); imshow(uint8(average_filtered_image * 255), []); title('Figure (e)');
subplot(2, 4, 6); imshow(uint8(product_image * 255), []); title('Figure (f)');
subplot(2, 4, 7); imshow(uint8(final_image * 255), []); title('Figure (g)');
subplot(2, 4, 8); imshow(uint8(power_law_transformed_image * 255), []); title('Figure (h)');