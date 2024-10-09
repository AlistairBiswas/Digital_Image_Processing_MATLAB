S = im2double(rgb2gray(imread('coins.jpg')));
[row, col] = size(S);
R = zeros(row, col);


for i = 1:row
   for j = 1:col-1
       x = S(i, j+1) - S(i, j);
       R(i,j) = x;
   end    
end


figure;
subplot(1,2,1);
imshow(S);
title('input');

subplot(1,2,2);
imshow(R);
title('derivatives');

