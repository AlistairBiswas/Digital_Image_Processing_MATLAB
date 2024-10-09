I =imread('concoin.png');
I = rgb2gray(I);

figure;
subplot(1,3,1);
imshow(I);
title('Original image');

I = imbinarize(I);
subplot(1,3,2);
imshow(I);
title('Binarized image');

[x,y] = size(I);
p = zeros(x,y);

w=[1 1 1;
   1 1 1;
   1 1 1];

for s=2:x-1
    for t=2:y-1
        w1=[I(s-1,t-1)*w(1) I(s-1,t)*w(2) I(s-1,t+1)*w(3) I(s,t-1)*w(4) I(s,t)*w(5) I(s,t+1)*w(6) I(s+1,t-1)*w(7) I(s+1,t)*w(8) I(s+1,t+1)*w(9)];
        p(s,t)=max(w1);
    end
end
subplot(1,3,3);
imshow(p);
title('Dilated image');

