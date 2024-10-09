I = imread('BW-Rose.jpg');
I = rgb2gray(I);

I = im2double(I);

figure; imshow(I);

[row, col] = size(I);

R = double(zeros(row,col));

c = 2.5; 

for i = 1:row
    for j = 1:col
        R(i,j) = c * log(I(i,j) + 1);
    end
end

figure; imshow(R);