%--------------------------------------------------------------------------
% IMPAD adds zero to the boundary of an image
%
% Cette fonction s'applique à n'importe quelles types d'images, couleurs ou
% monochromes
%
% Usage:    inOut = imPad(imIn, b)
%
% Arguments:    imIn - Image to be padded (greyscale or colour)
%               b - Width of padding boundary to be added
% 
% Returns: imOut - Padded image of size rows+2*b x cols+2*b
%
%--------------------------------------------------------------------------
function imOut = ImPad(imIn, b)
    x = size(imIn, 1);
    y = size(imIn, 2);
    z = size(imIn, 3);
    imOut = zeros(x+2*b, y+2*b, z, 'uint8');
    imOut(1+b:b+y,1+b:b+x,1:z) = imIn;
    uint8(imOut);
end

