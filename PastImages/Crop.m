A = imread('GBRune.png');

% [Start Pixel Hor, Start Pixel Ver,
% End Pixel Hor - Start Pixel Hor, End Pixel Ver - Start Pixel Ver]
A2 = imcrop(A, [399 169 534 502]);
subplot(1,2,1);
imshow(A);
subplot(1,2,2);
imshow(A2);