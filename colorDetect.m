function [ ] = colorDetect( image_name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   image = image_name;
 
   I2 = imread(image);
   I = imcrop(I2, [399 169 534 502]);
   
   
   G = rgb2gray(I);

   A = I(:, :, 1);
   F = imsubtract(A, G);
   % Matlab recommmended imbinarize > im2bw
   F = imbinarize(F, 0.10);

   F_fill = imfill(F, 'holes');
   
%%
% Since the location of the image is different depending on if the item is a rune versus a different item type, 
% checking if a certain part of the image got filtered through the initial
% image processing can determine whether that item is a rune or not.
   Z1 = imcrop(F_fill, [80 400 160 75]);

     count = 0;
       for index = 1:length(Z1)
          if Z1(index) == 1
             count = count + 1;
          end
       end

      if count == length(Z1)
        isRune = 1;
      else
        isRune = 0;
      end
 %% 
    if isRune == 1
       fprintf('Item is a Rune. Proceeding to Check Rune Quality.\n'); 
       F_crop = imcrop(F_fill, [50 95 70 55]);
       % If the drop is craft piece
       % I_test = imcrop(I, [50 25 75 75]);
       figure
       subplot(2,2,1);
       imshow(I)
       subplot(2,2,2);
       imshow(F_fill)
       subplot(2,2,3);
       imshow(I)
       subplot(2,2,4);
       imshow(Z1);
       count = 0;
       for index = 1:length(F_crop)
          if F_crop(index) == 1
             count = count + 1;
          end
       end

       a = arduino();
       RED_PIN = 'D11';
       GREEN_PIN = 'D10';
       BLUE_PIN = 'D9';
       writeDigitalPin(a,RED_PIN,1);
       writeDigitalPin(a,GREEN_PIN,1);
       writeDigitalPin(a,BLUE_PIN,1);


       if count == length(F_crop)
         fprintf('%s is a Epic or Legendary Rune. Will keep\n', image);
         writeDigitalPin(a,RED_PIN,0);
         writeDigitalPin(a,GREEN_PIN,1);
         writeDigitalPin(a,BLUE_PIN,0);
         pause(10);
       else
         fprintf('%s is a Blue Rune. Going to Sell.\n', image);
         writeDigitalPin(a,RED_PIN,1);
         writeDigitalPin(a,GREEN_PIN,0);
         writeDigitalPin(a,BLUE_PIN,0);
         pause(10);
       end
      
    else
%%
        fprintf('Proceeding to Select OK\n');
    end
end

