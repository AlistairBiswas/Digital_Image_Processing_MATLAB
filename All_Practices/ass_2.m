I =imread('pollen.jpg');

I = im2double(I);
[row,col]=size(I);

A= min(I(:));
B = max(I(:));
D=B-A;
M=255;

R= uint8((((I - A) ./ D) .* M )+ A);

figure;
subplot(2, 2, 1);
imshow(I);
title('Input Image');

subplot(2, 2, 2);
imshow(R);
title('Output Image');

subplot(2, 2, 3);
imhist(I);
title('Histogram (Input)');

subplot(2, 2, 4);
imhist(R);
title('Histogram (Output)');

