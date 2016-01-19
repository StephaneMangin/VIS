%--------------------------------------------------------------------------
% IMPLACE - place image at specified location within larger image
%
% Les images doivent  être de dimensions identiques.
% Les indices de positionnment additionnés de la taille de l'image à
% incruster ne doivent pas dépasser la taille de l'image source.
%
% Usage:    newIm = ImPlace(im1, im2, roff, coff)
%
% Arguments:    im1 - Image that im2 is to placed in.
%               im2 - Image to be placed.
%               roff - Row and column offset of placement of im2 relative
%               coff   to im1, (0,0) aligns top left corners.
% 
%--------------------------------------------------------------------------
function newim = ImPlace(im1, im2, roff, coff)
    x1 = size(im1, 1);
    y1 = size(im1, 2);
    z1 = size(im1, 3);
    x2 = size(im2, 1);
    y2 = size(im2, 2);
    z2 = size(im2, 3);
    % By default, z is from im1
    z = z1;
    if (z1 > z2)
        % return template from im1
        newim = im1(1:x1, 1:y1, 1:z);
        % and convert im2
        newim2 = im2(1:x2, 1:y2);
        % Redefine missing color dimension with greyscale value
        newim2(1:x2, 1:y2, 2:z) = im2(3);
    else
        z = z2;
        newim2 = im2;
        % And convert im1
        newim = im1(1:x1, 1:y1);
        % Redefine missing color dimension with greyscale value
        newim(1:x1, 1:y1, 2:z) = im1(3);
    end
    newim(1+roff:roff+y2, 1+coff:coff+x2, 1:z) = newim2;
    
    uint8(newim);
end

