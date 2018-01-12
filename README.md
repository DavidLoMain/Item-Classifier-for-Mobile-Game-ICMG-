# Item-Classifier-for-Mobile-Game-ICMG-
Personal Project for learning Matlab's Image Processing Toolbox
colorDetect.m is the main function that does all of the image processing given an input argument of the image file name.


This code will take in a screenshot of the victory screen from a dungeon run in the mobile game, Summoners War,
![img_4590](https://user-images.githubusercontent.com/35084641/34858718-baeb5996-f706-11e7-8b8f-471dee1c40d2.PNG)

and process the image using Matlab's Image Processing Toolbox in order to see if the quality of the item dropped.
A Good quality is a rune that has a color of purple or orange.
A Bad quality is a rune that has any other color (Blue, Green, White).


# Future possibilities with this Project,
- Signal to an Arduino Uno to use hardware to tap the screen of the tablet or mobile phone.
- Automate the process by automatically taking a screenshot every n minutes, then sending
  the image as an input to the Matlab function


P.S. There currently is no purpose for tts.m (Created by Siyi Deng, Which requires the license.txt)
but I included in case I want to add tts functionality in the future.
