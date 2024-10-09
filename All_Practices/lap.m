I = imread('Coins.jpg');

if size(I, 3) == 3
    I = rgb2gray(I);
end

[row, col] = size(I);
roll = 4;
remainder = mod(roll, 4);

if remainder == 0
    kernel_size = 3;
elseif remainder == 1
    kernel_size = 5;
elseif remainder == 2
    kernel_size = 7;
elseif remainder == 3
    kernel_size = 11;
end

pad_size = (kernel_size - 1) / 2;
T = padarray(I, [pad_size, pad_size], 'both');
O = zeros(row, col);

xy = [0 1 0
      1 -4 1 
      0 1 0];

for i = 1:row
    for j = 1:col
        N = double(T(i:i+2, j:j+2)); 
        t = xy .* N;
        O(i, j) = sum(t(:));
    end
end

Op = double(I) - O;

figure;
subplot(1, 3, 1);
imshow(I);
title('Original Image');

subplot(1, 3, 2);
imshow(uint8(O));  
title('Filtered Image');

subplot(1, 3, 3);
imshow(uint8(Op));  
title('Filtered Image');

