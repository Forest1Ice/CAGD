function p = bezierCurveInterp(q, draw, method)
%BEZIERCURVEINTERP Bezier curve interpolation
%   Interpolate given data points with Bezier curve.
%   Input:
%       q: sample data given in a row vector of points.
%       d: degree.
%       draw: whether plot the figure, true by default.
%       method: para method, "uniform", "chord", "centripetal",
%               "chebyUniform", "chebyChord", "chebyCentri",
%               "chebyChord" by default.
%   Output:
%       p: control pologon given in a row vector of points.

if nargin < 3
    method = "chebyChord";
end

if nargin < 2
    draw = true;
end

n = size(q, 2);
p = fitBezierCurve(q, n - 1, draw, method);

end