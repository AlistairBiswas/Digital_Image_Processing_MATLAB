% Load the image and convert to double
S = im2double(imread('coins.jpg'));

% Define Sobel filters
hx = [-1 0 1;
      -2 0 2;
      -1 0 1];
  
hy = [ 1  2  1;
       0  0  0;
      -1 -2 -1];

% Apply
Rx = imfilter(S, hx);
Ry = imfilter(S, hy);

% Calculate the magnitude of the gradient
R = sqrt(Rx.^2 + Ry.^2);

% Enhance
enhanced_image = S + R;

figure;
subplot(2,3,1);
imshow(S);
title('Input Image');

subplot(2,3,2);
imshow(Rx, []);
title('Edges along X (Horizontal)');

subplot(2,3,3);
imshow(Ry, []);
title('Edges along Y (Vertical)');

subplot(2,3,4);
imshow(R, []);
title('Combined Edge Magnitude');

subplot(2,3,5);
imshow(enhanced_image, []);
title('Enhanced Image');