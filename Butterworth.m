%--------------------------------------------------------------------------
% Function Butterworth
% @param n as rank for the filter
% @param imIn as an image
% @param frequency as the max frequency admited
%--------------------------------------------------------------------------
function imOut = Butterworth(n, imfft, frequency)
    cols = size(imfft, 1);
    rows = size(imfft, 2);
    xrange = [-cols/2:(cols/2-1)];
    yrange = [-rows/2:(rows/2-1)];
    %Frequence radicale
    [x,y] = meshgrid(xrange, yrange);
    radius = sqrt(x.^2 + y.^2);% A matrix with every pixel = radius relative to centre.
    butter = 1./(1+((radius./frequency).^(2*n)));
    %Application du filtre butterworth sur la partie reelle et la partie
    %imaginaire
    imfftBut = imfft .* butter;
    %imagesc(log(1+magBut))    
    imOut = abs(ifft2(fftshift(imfftBut)));
end
