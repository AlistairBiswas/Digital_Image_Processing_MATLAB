S = im2double(imread('coins.jpg'));

% Define Laplacian filter
h = [0 1 0;
     1 -4 1;
     0 1 0];

% Apply the filter
Rlap = imfilter(S, h);

% Enhance
enhanced_image_lap = S - Rlap;

figure;
subplot(1,3,1);
imshow(S);
title('Input Image');

subplot(1,3,2);
imshow(Rlap);
title('Laplacian Edges');

subplot(1,3,3);
imshow(enhanced_image_lap);
title('Enhanced with Laplacian');