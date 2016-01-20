%--------------------------------------------------------------------------
% IMPLACE - place image at specified location within larger image
%
% Les images doivent  être de dimensions identiques.
% Les indices de positionnment additionnés de la taille de l'image à
% incruster ne doivent pas dépasser la taille de l'image source.
% Si une image est en monochrome, l'image à incrustée sera convertie en
% monochrome également.
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
    % By default im1 is the template
    % Overwritten if smaller in color dimension
    newim = im1;
    % Greyscale inside color
    if (z1 > z2)
        % and convert im2
        newim = rgb2gray(im1);
        newim(1+roff:roff+y2, 1+coff:coff+x2) = im2;
    % Color inside greyscale
    elseif (z2 > z1)
        newim2 = rgb2gray(im2);
        newim(1+roff:roff+y2, 1+coff:coff+x2) = newim2;
    else
        newim(1+roff:roff+y2, 1+coff:coff+x2, 1:z1) = im2;
    end
    uint8(newim);
end

