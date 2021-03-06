% TP3 MANGIN BARDOU
% -------------------
lena = imread('images/lena.pgm');
leaves = imread('images/leaves.pgm');
mandrill = imread('images/mandrill_lumi.bmp');
blackline = imread('images/blackline.bmp');

% Question 1.1
% ------------
h = ones(3)/9;
imwrite(imfilter(leaves, h), 'results/TP3/Q11_3x3.bmp');

% Question 1.2
% ------------
hsize = 3;
sigma = 3;
h = fspecial('gaussian', hsize, sigma);
imwrite(imfilter(leaves, h), 'results/TP3/Q12_gaussian.bmp');

% Question 2.1
% ------------
figure(1);
dx = [1;-1];
dy = [1,-1];
AA_x = conv2(double(mandrill), dx, 'same');
imwrite(AA_x, 'results/TP3/Q21_AA_x.bmp');
AA_y = conv2(double(mandrill), dy, 'same');
imwrite(AA_y, 'results/TP3/Q21_AA_y.bmp');
norm = sqrt(AA_x.^2 + AA_y.^2);
figure(1), imagesc(norm);

% Question 2.2
% ------------
% Ce noyau est un peu moins 'précis' que le suivant
edgeFilter4 = [0,-1,0;-1,4,-1;0,-1,0];
imwrite(imfilter(mandrill, edgeFilter4), 'results/TP3/Q22_laplacian4.bmp');
% Ce noyau affecte plus l'entourage, ce qui résulte d'une détection plus
% nette des bords
edgeFilter8 = [-1,-1,-1;-1,8,-1;-1,-1,-1];
imwrite(imfilter(mandrill, edgeFilter8), 'results/TP3/Q22_laplacian8.bmp');

% Question 3
% ----------
gaussianFilter = [1,4,7,4,1;4,20,33,20,4;7,33,55,33,7;4,20,33,20,4;1,4,7,4,1]/331;
resultG = imfilter(mandrill, gaussianFilter);
resultE = imfilter(resultG, edgeFilter8);
%figure(10);
%for i=0:1:10
%    temp=resultG+i*resultE;
%    figure(10), imshow(temp);
%    pause(2);
%end
k = 5; % indice d'intensité de l'application du sharpening
imwrite(mandrill + k * resultE, 'results/TP3/Q3_sharpFilter1.bmp');
sharpFilter = fspecial('unsharp');
imwrite(imfilter(mandrill, sharpFilter), 'results/TP3/Q3_sharpFilter2.bmp');

% Question 4
% ----------
lenaNoise = imnoise(lena, 'salt & pepper', 0.05);
imwrite(lenaNoise, 'results/TP3/Q4_lenaNoise.bmp');
imwrite(medfilt2(lenaNoise), 'results/TP3/Q4_lenaUn-noisedMedian.bmp');
% Le filtre moyenneur 'étale le bruit'
h = ones(3)/9;
imwrite(imfilter(lenaNoise, h), 'results/TP3/Q4_lenaUn-noisedMoyenne.bmp');