function p = bezierCurveInterp2(q, t, draw)
%BEZIERCURVEINTERP Bezier curve interpolation
%   Interpolate given data points with Bezier curve.
%   Input:
%           q: sample data given in a row vector of points.
%           t: parameter values.
%           draw: whether plot the figure, false by default.
%   Output:
%           p: control pologon given in a row vector of points.

% input check
if length(t) ~= size(q, 2)
    error('Invalid input! Expect length of para list matches sample data!');
end

if nargin < 3
    draw = false;
end

n = size(q, 2);
p = fitBezierCurve2(q, n - 1, t, draw);

end