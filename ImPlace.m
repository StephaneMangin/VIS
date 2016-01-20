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
    if (z1 > z2)
        % return template from im1
        newim = im1(1:x1, 1:y1, 1:z1);
        % and convert im2
        newim2 = im2(1:x2, 1:y2) * mean(im2);
        newim(1+roff:roff+y2, 1+coff:coff+x2) = newim2;
    elseif (z2 > z1)
        % return template from im1
        newim = im1(1:x1, 1:y1, 1:z1);
        % and convert im2
        newim2 = im2(1:x2, 1:y2);
        newim(1+roff:roff+y2, 1+coff:coff+x2) = newim2;
    else
        newim = im1(1:x1, 1:y1);
        newim(1+roff:roff+y2, 1+coff:coff+x2) = im2;
    end
    uint8(newim);
end

