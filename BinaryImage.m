%--------------------------------------------------------------------------
% BINARYIMAGE
%
% Function which create a black 30x30 matrix and add
% blank column in there
%
% Usage:    imOut = BinaryImage()
% 
% Returns: imOut
% 
%--------------------------------------------------------------------------
function imOut = BinaryImage()
    blackMatrix = zeros(30,30);
    % Blank columns
    blackMatrix(:,1:6) = 255;
    % Blank columns
    blackMatrix(:,13:18) = 255;
    % Blank columns
    blackMatrix(:,25:30) = 255;
    imOut = blackMatrix;
end