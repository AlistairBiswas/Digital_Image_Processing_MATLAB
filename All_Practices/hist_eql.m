I = imread('coins.jpg');
I = rgb2gray(I);

[L, W] = size(I);
total_pixels = L * W;
hist_counts = zeros(1, 256);

for i = 1:L
    for j = 1:W
        pixel_value = I(i, j) + 1;
        hist_counts(pixel_value) = hist_counts(pixel_value) + 1;
    end
end

pdf = hist_counts / total_pixels;

cdf = zeros(1, 256);
cdf(1) = pdf(1);
for k = 2:256
    cdf(k) = cdf(k-1) + pdf(k);
end

equalized_cdf = cdf * 255;

equalized_cdf = round(equalized_cdf);

equalized_img = zeros(L, W);
for i = 1:L
    for j = 1:W
        pixel_value = I(i, j) + 1;
        equalized_img(i, j) = equalized_cdf(pixel_value);
    end
end

equalized_img = uint8(equalized_img);

figure;
subplot(221), imshow(uint8(I));
title('Original Image');
subplot(222), imshow(equalized_img);
title('Equalized Image');

original_hist = hist_counts;
equalized_hist = zeros(1, 256);
for i = 1:L
    for j = 1:W
        pixel_value = equalized_img(i, j) + 1;
        equalized_hist(pixel_value) = equalized_hist(pixel_value) + 1;
    end
end

subplot(2,2,3);
bar(hist_counts);
title('Original Histogram');
xlim([0 255]);

subplot(2,2,4);
bar(equalized_hist);
title('Equalized Histogram');
xlim([0 255]);