lena = imread('images/lena.pgm');
small = imread('images/small.bmp');
small_color = imread('images/small-color.bmp');
clown = imread('images/clown.bmp');
boats = imread('images/boats.bmp');

% Question 1
% ----------
q1_greyscale = ImPad(lena, 15);
imwrite(q1_greyscale, 'results/Q1-greyscale.bmp');
q1_color = ImPad(clown, 15);
imwrite(q1_color, 'results/Q1-color.bmp');

% Question 2
% ----------
q2_greyscale = ImErase(lena, 15);
imwrite(q2_greyscale, 'results/Q2-greyscale.bmp');
q2_color = ImErase(clown, 15);
imwrite(q2_color, 'results/Q2-color.bmp');

% Question 3
% ----------
q3_greyscale = ImSetBorder(lena, 30, 70);
imwrite(q3_greyscale, 'results/Q3-greyscale.bmp');
% Je n'ai pas réussi a faire une bordure couleur...
q3_color = ImSetBorder(boats, 25, 120);
imwrite(q3_color, 'results/Q3-color.bmp');

% Question 4
% ----------
q4_fullGreyscale = ImPlace(lena, small, 85, 15);
imwrite(q4_fullGreyscale, 'results/Q4-fullGreyscale.bmp');
q4_colorToColor = ImPlace(boats, small_color, 85, 15);
imwrite(q4_colorToColor, 'results/Q4-colorToColor.bmp');
% Pas de solution pour gérer les différentes configuration, ce n'est pas
% trivial... Même pour le cas couleur vers couleur. Déçu...
% Il y a un exemple d'images dans 'results' à un instant t du développement
q4_greyscaleToColor = ImPlace(boats, small, 85, 15);
imwrite(q4_greyscaleToColor, 'results/Q4-greyscaleTocolor.bmp');
q4_colorToGreyscale = ImPlace(lena, small_color, 85, 15);
imwrite(q4_colorToGreyscale, 'results/Q4-colorToGreyscale.bmp');

% Question 5
% ----------
imglist = dir(['boucle/' '*.bmp']);
fnum = length(imglist)
for i=1:fnum
    image = imread(['boucle/' imglist(i).name]);
    q5 = ImPad(image, 15);
    imwrite(q5, ['boucle/results/' imglist(i).name]);
end