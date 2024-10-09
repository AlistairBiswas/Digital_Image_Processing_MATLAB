S = im2double(rgb2gray(imread('apples.jpg')));
[row, col] = size(S);

R2_forward = zeros(row, col);
R2_central = zeros(row, col);
R2_backward = zeros(row, col);
enhanced2_forward = zeros(row, col);
enhanced2_central = zeros(row, col);
enhanced2_backward = zeros(row, col);

% Second forward derivative along the X-axis
for i = 1:row
    for j = 1:col-2
        x = S(i, j+2) - 2 * S(i, j+1) + S(i, j);
        R2_forward(i, j) = x;
    end
end

% Second backward derivative along the X-axis
for i = 1:row
    for j = 3:col
        x = S(i, j) - 2 * S(i, j-1) + S(i, j-2);
        R2_backward(i, j) = x;
    end
end

% Second central derivative along the X-axis
for i = 1:row
    for j = 2:col-1
        x = S(i, j+1) - 2 * S(i, j) + S(i, j-1);
        R2_central(i, j) = x;
    end
end

% Enhance
for i = 1:row
    for j = 1:col
        enhanced2_forward(i, j) = S(i, j) + R2_forward(i, j);
        enhanced2_central(i, j) = S(i, j) + R2_central(i, j);
        enhanced2_backward(i, j) = S(i, j) + R2_backward(i, j);
    end
end

figure;

subplot(3, 3, 1);
imshow(S);
title('Original Grayscale Image');

subplot(3, 3, 2);
imshow(R2_forward);
title('Edges (Second Forward Derivative)');

subplot(3, 3, 3);
imshow(enhanced2_forward);
title('Enhanced Image (Second Forward Derivative)');

subplot(3, 3, 5);
imshow(R2_central);
title('Edges (Second Central Derivative)');

subplot(3, 3, 6);
imshow(enhanced2_central);
title('Enhanced Image (Second Central Derivative)');

subplot(3, 3, 8);
imshow(R2_backward);
title('Edges (Second Backward Derivative)');

subplot(3, 3, 9);
imshow(enhanced2_backward);
title('Enhanced Image (Second Backward Derivative)');