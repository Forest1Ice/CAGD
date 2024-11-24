function p = bsplineSurfInterp(q, d, draw, method)
%BEZIERSURFINTERP B-spline surface interpolation
%   Input:
%       Interpolate given data points with B-spline surface.
%       d: degree of tu, tv direction in the form of a row vector.
%       draw: whether plot the figure, true by default.
%       method: para method, "chord", "chebyChord", "chebyChord" by default.
%   Output:
%       p: control pologon given in the form of a cell array.

if nargin < 4
    method = "chebyChord";
end

if nargin < 3
    draw = true;
end

[m, n] = size(q);
du = d(1);
dv = d(2);
p = cell(m, n);
% knot vectors
u = zeros(1, n + du + 1);
v = zeros(1, m + dv + 1);

% Surface parameterization
[tu, tv] = surfParams(q, method);

% compute knot vectors
u(n+1:n+du+1) = 1.0;
for i = 2:n-du
    u(du + i) = 1 / du * sum(tu(i:i+du-1));
end

v(m+1:m+dv+1) = 1.0;
for i = 2:m-dv
    v(dv + i) = 1 / dv * sum(tv(i:i+dv-1));
end

% compute control points
for i = 1:m
    M = bsplineCurveInterp2(cell2mat(q(i, :)), du, tu, false);
    p(i, :) = num2cell(M, 1);
end

for j = 1:n
    N = bsplineCurveInterp2(cell2mat(p(:, j)'), dv, tv, false);
    p(:, j) = num2cell(N, 1)';
end

if draw
    figure('Name', 'B-spline Surface Interpolation')
    plotBsplineSurface(p, u, v, 0:0.01:1, 0:0.01:1, false);
    [x, y, z] = cell2coord(q);
    plot3(x, y, z, 'r.', 'MarkerSize', 10);
    legend('B-spline Surface','Sample Data');
end

end