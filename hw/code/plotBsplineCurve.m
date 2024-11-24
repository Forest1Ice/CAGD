function plotBsplineCurve(d, u, p, t, polygon)
%PLOTBSPLINECURVE Draw Bspline curve
%   Input:
%         d: degree of curve.
%         u: knot vector
%         p: control pologon given in a row vector of points.
%         t: parameter values.
%         polygon: true, plot control pologon, false otherwise. 
%                  true by default.

if nargin < 5
    polygon = true;
end

[m, n] = size(p);   % dimension
s = length(t);
x = zeros(m, s);

% check whether m = n + p + 1 holds
if length(u) ~= n + d + 1
    error('Invaild input! Expecting m = n + p + 1!');
end

for i = 1:s
    span = findSpan(d, t(i), u);
    N = basisFuncs(span, t(i), d, u);
    for k = 0:d
        x(:, i) = x(:, i) + N(k + 1) * p(:, span - d + k);
    end
end

% plot Bspline curve
if m == 2   % two dimension
    hold on
    plot(x(1,:), x(2,:), '-b');
    if polygon
        plot(p(1,:), p(2,:), 'r--.', 'MarkerSize', 10);
        legend('Bspline curve','control polygon');
    end
elseif m == 3   % three dimension
    hold on
    plot3(x(1,:), x(2,:), x(3,:), '-b');
    if polygon
        plot3(p(1,:), p(2,:), p(3,:), 'r--.', 'MarkerSize', 10);
        legend('Bspline curve','control polygon');
    end
    grid
    view([-80 30]);
else
    error('Invalid input! Expecting dimension of points either 2 or 3!');
end

end