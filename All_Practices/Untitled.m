% Read the image
inputImage = imread('input.png');

% Convert the image to grayscale if it's a color image
if size(inputImage, 3) == 3
    grayImage = rgb2gray(inputImage);
else
    grayImage = inputImage;
end

% Convert the image to double precision for calculation
grayImage = im2double(grayImage);

% Get the minimum and maximum intensity values from the grayscale image
minIntensity = min(grayImage(:));
maxIntensity = max(grayImage(:));

% Perform contrast stretching manually
stretchedImage = (grayImage - minIntensity) / (maxIntensity - minIntensity);

% Convert the stretched image back to uint8
stretchedImage = im2uint8(stretchedImage);

% Display the original grayscale image
figure;
subplot(1, 2, 1);
imshow(im2uint8(grayImage)); % Convert to uint8 for display
title('Original Grayscale Image');

% Display the contrast-stretched image
subplot(1, 2, 2);
imshow(stretchedImage);
title('Contrast Stretched Image');

% Save the contrast-stretched image
imwrite(stretchedImage, 'contrast_stretched_image.jpg');