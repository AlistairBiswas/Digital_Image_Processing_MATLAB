S = im2double(imread('coins.jpg'));

% Define Robert's Cross filters
h1 = [1 0; 0 -1];
h2 = [0 1; -1 0];

% Apply
R1 = imfilter(S, h1);
R2 = imfilter(S, h2);

% Calculate the magnitude of the gradient
R_roberts = sqrt(R1.^2 + R2.^2);

% Enhance
enhanced_image_roberts = S + R_roberts;

figure;
subplot(2,3,1);
imshow(S);
title('Input Image');

subplot(2,3,2);
imshow(R1, []);
title('Robert''s Cross Edges 1');

subplot(2,3,3);
imshow(R2, []);
title('Robert''s Cross Edges 2');

subplot(2,3,4);
imshow(R_roberts, []);
title('Combined Robert''s Cross Magnitude');

subplot(2,3,5);
imshow(enhanced_image_roberts, []);
title('Enhanced Image with Robert''s Cross');