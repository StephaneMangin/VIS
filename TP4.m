% TP4 MANGIN BARDOU
% -------------------
desert = imread('images/desert.pgm');
mountain = imread('images/mountain.pgm');
street = imread('images/street.pgm');
lena = imread('images/lena.pgm');
lenaNoised = imread('images/lenabruitee.pgm');

% Question 1.1
% Transformée de Fourier
% ----------------------
figure(11);
I=double(street);
imfft = fft2(I);
imfft = fftshift(imfft);
mag = abs(imfft);
phase = angle(imfft);
figure(11), surf(log(1+mag));

% Question 1.2
% Transformée de Fourier Inverse
% -------------------------------
real = mag.*cos(phase);
imaginary = mag.*sin(phase);
newfft = (real + 1i .*imaginary);
im12 = abs(ifft2(fftshift(newfft)));
imwrite(round(im12)/255, 'results/TP4/Q11_fourier_inverse.bmp');

% Question 1.3.1
% Binary Image
% --------------
binaryImage = BinaryImage();
%imshow(binaryImage, 'InitialMagnification', 'fit');
imwrite(binaryImage, 'results/TP4/Q131_vertical.bmp');
% Do a 90° rotation on the binaryImage
binaryImageRotated = rot90(binaryImage);
%imshow(binaryImageRotated, 'InitialMagnification', 'fit');
imwrite(binaryImageRotated, 'results/TP4//Q131_horizontal.bmp');

% Question 1.3.2
% Center the specter of the fft for the binaryImage
% -------------------------------------------------
I132 = double(binaryImage);
imfft132 = fft2(I132);
imfft132 = fftshift(imfft132);
mag132 = abs(imfft132);
imwrite(log(1+mag132), 'results/TP4/Q132_fourier_vertical.bmp');
surf(log(1+mag132))
%We got a lot of frequencies for the binaryImage and every frequency is
%represented a few time

% Center the specter of the fft for the binaryImageRotated
% --------------------------------------------------------
I1322 = double(binaryImageRotated);
imfft1322 = fft2(I1322);
imfft1322 = fftshift(imfft1322);
mag1322 = abs(imfft1322);
imwrite(log(1+mag1322), 'results/TP4/Q132_fourier_horizontal.bmp');
surf(log(1+mag1322))
% We got a few value of frequency for the binaryImageRotated and each of
% them as a very high rank

% Question 1.4
% Visualisation of street.pgm
% ---------------------------
figure(141);
mag141 = abs(fftshift(fft2(double(street))));
figure(141), surf(log(1+mag141));


% Visualisation of desert.pgm
% ---------------------------
figure(142);
mag142 = abs(fftshift(fft2(double(desert))));
figure(142), surf(log(1+mag142));
% Spikes lines of frequencies (vertical for street and horizontal for desert)
% shows us that desert image and street image have an reverse repartitions
% of frequencies.

% Visualisation of mountain.pgm
% -----------------------------
figure(143);
mag143 = abs(fftshift(fft2(double(mountain))));
figure(143), surf(log(1+mag143));
% We don't have big difference between each frequency because the image
% have a homogeneous repartitions of frequencies.

% Question 2.1
% Butterworth filter
% ------------------
imOut211 = Butterworth(1, fftshift(fft2(double(lena))), 100);
imwrite(round(imOut211)/255, 'results/TP4/Q21_lena.bmp');

imOut212 = Butterworth(50, fftshift(fft2(double(lena))), 100);
imwrite(round(imOut212)/255, 'results/TP4/Q21_lena_butterworth.bmp');
%After applying the Butterworth filter (figure 18) we can see ringing
%effect appears as we increase the value of the rank

imOut213 = Butterworth(1, imfft21,400);
imwrite(round(imOut213)/255, 'results/TP4/Q21_lena_butterworth_max.bmp');
%After applying the Butterworth filter (figure 19) we can see that the
%image is more clear as we increase the value of the frequency maximum
%authorized

% Question 2.2
% unNoised Lena
% -------------
% Loading and applying Fourier transform on lena image
figure(221);
mag221 = abs(fftshift(fft2(double(lena))));
figure(221), surf(log(1+mag221));
% Loading and applying Fourier transform on lena noised image
figure(222);
mag222 = abs(fftshift(fft2(double(lenaNoised))));
figure(222), surf(log(1+mag222));
% We thought, we could remove noise from the image with the filter
% Butterworth but it didn't work as we plan. We still thought that applying
% the right filter on the LenaNoised Fourier transform matrix should do the
% work
imOut222 = Butterworth(5, fftshift(fft2(double(lena))), 450);
imwrite(round(imOut222)/255, 'results/TP4/Q22_lena_unnoised_butterworth.bmp');

% Loading the file masque.mat and display it
% ------------------------------------------
figure(224);
figure(225);
masqueStruct = load('masque.mat');
figure(224), disp(masqueStruct);
masque = masqueStruct.F_m;
figure(225), surf(masque);

% We could apply the filter on each lenaNoised matrix point to remove
% high frequencies from the Fourier transform apply on lenaNoised image

% Using the masque.mat to unoised the lenaNoised file
% ---------------------------------------------------
unNoised = imfft221.*masque;
unNoised = abs(ifft2(ifftshift(unNoised)));
imwrite(round(unNoised)/255, 'results/TP4/Q22_lena_masque_unnoised.bmp');
