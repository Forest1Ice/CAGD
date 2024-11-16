function S = horner2(a, u, v, draw)
%HORNER2 Use Horner algorithm to compute points on the power basis surface.
%   Input:
%       a: coefficients matrix with the 3-d entries in the form of a cell
%       array.
%       u, v: parameters to be evaluated on.
%       draw:   whether to plot the surface, false by default.
%   Output:
%       S: points on the surface in the form of a cell array.

if nargin < 4
    draw = false;
end

[m, ~] = size(a);
s = length(u);
t = length(v);
b = zeros(3, m);
S = cell(s, t);

for k = 1:s
    for r = 1:t
        for i = 1:m % v-direction
            coeff = cell2mat(a(i, :));
            b(:, i) = horner1(coeff, v(r));
        end
        S{k, r} = horner1(b, u(k));
    end
end

% extract x,y,z coordinates
[x, y, z] = cell2coord(S);

if draw
    surf(x, y, z, EdgeColor = "none", FaceColor = "blue");
    xlabel('X');
    ylabel('Y');
    zlabel('Z');
    grid on
    view([-80 30]);
end

end