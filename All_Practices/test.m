% Load the image and convert to double
S = im2double(rgb2gray(imread('coins.jpg')));
[row, col] = size(S);

% Define Sobel filters
hx = [-1 0 1;
      -2 0 2;
      -1 0 1];
  
hy = [ 1  2  1;
       0  0  0;
      -1 -2 -1];
  
kernel_size = 3;
  
pad_size = (kernel_size - 1) / 2;
P = padarray(S, [pad_size, pad_size], 'both');
Rx = zeros(row, col);
Ry = zeros(row, col);

for i = 1:row
    for j = 1:col
        Region = double(P(i:i+kernel_size-1, j:j+kernel_size-1)); 
        t = hx .* Region;
        Rx(i, j) = sum(t(:));
    end
end

for i = 1:row
    for j = 1:col
        Region = double(P(i:i+kernel_size-1, j:j+kernel_size-1)); 
        t = hy .* Region;
        Ry(i, j) = sum(t(:));
    end
end

% Calculate the magnitude of the gradient
R = sqrt(Rx.^2 + Ry.^2);

% Enhance
enhanced_image = S - R;

figure;
subplot(2,3,1);
imshow(S);
title('Input Image');

subplot(2,3,2);
imshow(Rx);
title('Edges along X (Horizontal)');

subplot(2,3,3);
imshow(Ry);
title('Edges along Y (Vertical)');

subplot(2,3,4);
imshow(R);
title('Combined Edge Magnitude');

subplot(2,3,5);
imshow(enhanced_image);
title('Enhanced Image');