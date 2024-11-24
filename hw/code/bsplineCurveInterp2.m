function p = bsplineCurveInterp2(q, d, t, draw)
%BSPLINECURVEINTERP B-spline curve interpolation.
%   Input: 
%       q: sample data given in a row vector of points.
%       d: degree.
%       t: parameter values.
%       draw: whether plot the figure, false by default.
%   Output:
%       p: control pologon given in a row vector of points.

% input check
if length(t) ~= size(q, 2)
    error('Invalid input! Expect length of para list matches sample data!');
end

if nargin < 4
    draw = false;
end

[m, n] = size(q);
u = zeros(1, n + d + 1);    % knot vector
N = zeros(n, n);
p = zeros(m, n);

% compute knot vector
u(n+1:n+d+1) = 1.0;
for i = 2:n-d
    u(d + i) = 1 / d * sum(t(i:i+d-1));
end

% compute coefficient matrix
for i = 1:n
    span = findSpan(d, t(i), u);
    N(i, span-d:span) = basisFuncs(span, t(i), d, u);
end

% solve equation
for k = 1:m
    x = N \ q(k, :)';
    p(k, :) = x';
end

% plot Bezier curve and data points
if draw
    figure('Name', "B-spline Curve Interpolation");
    plotBsplineCurve(d, u, p, 0:0.01:1, false);
    if m == 2
        plot(q(1,:), q(2,:), 'r.', 'MarkerSize', 10);
    elseif m == 3
        plot3(q(1,:), q(2,:), q(3, :), 'r.', 'MarkerSize', 10);
    end
    legend("B-spline curve", "Sample data");
end

end