I_1 = imread('input.jpg');

I_1 = rgb2gray(I_1);
figure; imshow(I_1);

[row, col] = size(I_1);
I_2 = uint8(zeros(row, col));

for i = 1:row
    for j = 1:col
        I_2(i, j) = I_1(i, col + 1 - j);
    end
end

figure; imshow(I_2);
I_3 = uint8(zeros(row, column * 2));

for i = 1:row
    for j = 1:col
        I_3(i, j) = I1(i, j);
        I_3(i, j + col) = I2(i, j);
    end
end

figure; imshow(I_3);