% David Lo
% 10/17/2017
% Color Detection

format compact
clear
clc

%I = imread('Zaiross.jpg');
%I = imread('MonsterShapes.jpg');
I = imread('GBRune2.png');
subplot(2,2,1);
imshow(I);
I2 = imread('GBRune3.png');
subplot(2,2,3);
imshow(I2);
G = rgb2gray(I);
%subplot(2,2,2);
%imshow(G);
G2 = rgb2gray(I2);
% 1 = Red 2 = Green 3 = Blue || (2&&3 is the same as 1)
A = I(:, :, 1);
A2 = I2(:,:,1);
%subplot(2,2,3);
%imshow(A);
F = imsubtract(A, G);
F = im2bw(F, 0.10);
subplot(2,2,2);
imshow(F);
Z = imsubtract(A2, G2);
Z = im2bw(Z, 0.10);
subplot(2,2,4);
imshow(Z);

%%
% Clears out the image to obtain a clean square
figure 
Z_fill = imfill(Z, 'holes');
subplot(1,2,1);
imshow(Z);
subplot(1,2,2);
imshow(Z_fill);

%% 
figure
Z_crop = imcrop(Z_fill, [45 93 75 57]);
subplot(1,2,1);
imshow(Z_fill);
subplot(1,2,2);
imshow(Z_crop);

figure
F_crop = imcrop(F, [45 93 75 57]);
subplot(1,2,1);
imshow(F);
subplot(1,2,2);
imshow(F_crop);
%%
image = 'Test_Legend/Epic';
count = 0;
for index = 1:length(Z_crop)
   if Z_crop(index) == 1
       count = count + 1;
   end
end

if count == length(Z_crop)
    fprintf('%s is a Epic or Legendary Rune. Will keep\n', image);
else
    fprintf('%s is a Blue Rune. Going to Sell.\n', image);
end

image = 'Test_BlueRune';
count = 0;
for index = 1:length(F_crop)
   if F_crop(index) == 1
       count = count + 1;
   end
end

if count == length(F_crop)
    fprintf('%s is a Epic or Legendary Rune. Will keep\n', image);
else
    fprintf('%s is a Blue Rune. Going to Sell.\n', image);
end
% Binary Image: 1 = White | 0 = Black
%Color_F = F(50:100,100:150)
%Color_Z_fill = Z_fill(50:100,100:150)

%sprintf vs fprintf still idk difference


