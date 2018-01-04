%%
% Test Script
% This file, "Test.m", is for testing different aspects of the entire
% project.
%
% Current Test: Classify Item Type
I = imread('IMG_4692.png');
I2 = imread('IMG_4598.png');

I = imcrop(I, [399 169 534 502]);
I2 = imcrop(I2, [399 169 534 502]);

G1 = rgb2gray(I);
G2 = rgb2gray(I2);
A1 = I(:,:,1);
A2 = I2(:,:,1);
F1 = imsubtract(A1, G1);
F2 = imsubtract(A2, G2);
F1 = imbinarize(F1, 0.10);
F2 = imbinarize(F2, 0.10);

F1 = imfill(F1, 'holes');
F2 = imfill(F2, 'holes');

Z1 = imcrop(F1, [80 400 160 75]);
Z2 = imcrop(F2, [80 400 160 75]);

 count = 0;
   for index = 1:length(Z1)
      if Z1(index) == 1
         count = count + 1;
      end
   end


  if count == length(Z1)
    fprintf('Item is a Rune. Proceed to Rune Quality Check.\n'); 
  else
    fprintf('Item is not a Rune. Proceeding to Click Ok.\n');
  end

  %% The following is simply for displaying the process through which the image went through.
figure
subplot(2,3,1);
imshow(I);
subplot(2,3,2);
imshow(F1);
subplot(2,3,3);
imshow(Z1)
subplot(2,3,4);
imshow(I2);
subplot(2,3,5);
imshow(F2);
subplot(2,3,6);
imshow(Z2);