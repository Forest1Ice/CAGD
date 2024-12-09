function [x, y, z] = cell2coord(S)
%CELL2POINT A helper function for converting a cell array of points to
%   x,y(,z) coordinates.

d = length(S{1, 1});
S = cell2mat(S);

if d == 2
    x = S(1:2:end - 1, :);
    y = S(2:2:end, :);
    [m, n] = size(x);
    z = zeros(m, n);    % for plotting in 2d
elseif d == 3
    x = S(1:3:end - 2, :);
    y = S(2:3:end - 1, :);
    z = S(3:3:end, :);
else
    error('Invalid input! Expect dimension of points two or three!');
end

end