%--------------------------------------------------------------------------
% IMERASE - remove the boundary of an, image
%
% Cette fonction s'applique à n'importe quelles types d'images. Il faut
% cependant indiquer une valeur cohérente par rapport à l'image choisie
% (3 dimensions pour couleurs, une seule pour monochrome)
%
% Usage:    imOut = imErase(imIn, b)
%
% Arguments:    imIn - Image to be unpadded (greyscale or colour)
%               b - Width of the boundary to remove
% 
% Returns: imOut - Padded image of size rows-2*b x cols-2*b
%
%--------------------------------------------------------------------------
function imOut = ImErase(imIn, b)
    x = size(imIn, 1);
    y = size(imIn, 2);
    z = size(imIn, 3);
    imOut = imIn(1+b:y-b,1+b:x-b,1:z);
    uint8(imOut);
end