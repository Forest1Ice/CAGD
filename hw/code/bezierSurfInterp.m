function p = bezierSurfInterp(q, draw, method)
%BEZIERSURFINTERP Bezier surface interpolation
%   Input:
%       Interpolate given data points with Bezier surface.
%       draw: whether plot the figure, true by default.
%       method: para method, "chord", "chebyChord", "chebyChord" by default.
%   Output:
%       p: control pologon given in the form of a cell array.

if nargin < 3
    method = "chebyChord";
end

if nargin < 2
    draw = true;
end

[m, n] = size(q);
p = cell(m, n);

% Surface parameterization
[u, v] = surfParams(q, method);

% compute control points
for i = 1:m
    M = bezierCurveInterp2(cell2mat(q(i, :)), u, false);
    p(i, :) = num2cell(M, 1);
end

for j = 1:n
    N = bezierCurveInterp2(cell2mat(p(:, j)'), v, false);
    p(:, j) = num2cell(N, 1)';
end

if draw
    figure('Name', 'Bezier Surface Interpolation')
    plotBezierSurface(p, 0:0.01:1, 0:0.01:1, false);
    [x, y, z] = cell2coord(q);
    plot3(x, y, z, 'r.', 'MarkerSize', 10);
    legend('Bezier Surface','Sample Data');
end

end