S = im2double(rgb2gray(imread('apples.jpg')));
[row, col] = size(S);

R_forward = zeros(row, col);
R_central = zeros(row, col);
R_backward = zeros(row, col);
enhanced_forward = zeros(row, col);
enhanced_central = zeros(row, col);
enhanced_backward = zeros(row, col);

% forward derivative along the Y-axis
for i = 1:row-1
    for j = 1:col
        x = S(i+1, j) - S(i, j);
        R_forward(i, j) = x;
    end
end

% backward derivative along the Y-axis
for i = 2:row
    for j = 1:col
        x  = S(i, j) - S(i-1, j);
        R_backward(i, j) = x;
    end
end

% central derivative along the Y-axis
for i = 2:row-1
    for j = 1:col
        x = (S(i+1, j) - S(i-1, j));
        R_central(i, j) = x;
    end
end

% Enhance
for i = 1:row
    for j = 1:col
        enhanced_forward(i, j) = S(i, j) + R_forward(i, j);
        enhanced_central(i, j) = S(i, j) + R_central(i, j);
        enhanced_backward(i, j) = S(i, j) + R_central(i, j);
    end
end

figure;
subplot(3, 3, 1);
imshow(S);
title('Original Grayscale Image');

subplot(3, 3, 2);
imshow(R_forward);
title('Edges (Forward Derivative)');

subplot(3, 3, 3);
imshow(enhanced_forward);
title('Enhanced Image (Forward Derivative)');

subplot(3, 3, 5);
imshow(R_central);
title('Edges (Central Derivative)');

subplot(3, 3, 6);
imshow(enhanced_central);
title('Enhanced Image (Central Derivative)');

subplot(3, 3, 8);
imshow(R_backward);
title('Edges (Backward Derivative)');

subplot(3, 3, 9);
imshow(enhanced_backward);
title('Enhanced Image (Backward Derivative)');
