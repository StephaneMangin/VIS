%--------------------------------------------------------------------------
% IMSETBORDER - sets pixels on image border to a value
%
% Cette fonction s'applique à n'importe quelles types d'images. Il faut
% cependant indiquer une valeur cohérente par rapport à l'image choisie
% (3 dimensions pour couleurs, une seule pour monochrome)
%
% Usage:    imOut = ImSetBorder(imIn, b, v)
%
% Arguments:    imIn - Image
%               b - border size
%               v - value to set image borders
% 
% Returns: imOut - bordered image of size rows+2*b x cols+2*b
% 
%--------------------------------------------------------------------------
function imOut = ImSetBorder(imIn, b, v)
    x = size(imIn, 1);
    y = size(imIn, 2);
    z = size(imIn, 3);
    % Create a new image from imIn sizes
    imOut = ones(x+2*b, y+2*b, z, 'uint8');
    % Apply background in it
    imOut(1:x+2*b, 1:y+2*b, 1:z) = v;
    % Inject image inside
    imOut(1+b:b+y,1+b:b+x, 1:z) = imIn;
    uint8(imOut);
end

