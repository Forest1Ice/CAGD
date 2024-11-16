function [x, y, z] = cell2coord(S)
%CELL2POINT A helper function for converting a cell array of points to x,y,z
%   coordinates.

S = cell2mat(S);
x = S(1:3:end - 2, :);
y = S(2:3:end - 1, :);
z = S(3:3:end, :);

end