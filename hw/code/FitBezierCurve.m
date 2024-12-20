function p = fitBezierCurve(q, n, draw, method)
%SMOOTHFITBEZIERCURVE Bezier curve fitting.
%   Use least square method to fit given data points with Bezier curve.
%   Input:
%           q: sample data given in a row vector of points.
%           n: degree.
%           draw: whether plot the figure, true by default.
%           method: para method, "uniform", "chord", "centripetal",
%                   "chebyUniform", "chebyChord", "chebyCentri",
%                   "chebyChord" by default.
%   Output:
%           p: control pologon given in a row vector of points.
%   LS:     min ||Mp - q||_2.

if nargin < 4
    method = "chebyChord";
end

if nargin < 3
    draw = true;
end

[~, d] = size(q);   % dimension

% generate para sequence
if isequal(method, "uniform")
    t = 0:1/(d-1):1;
elseif isequal(method, "chord")
    t = chordPara(q);
elseif isequal(method, "centri")
    t = centriPara(q);
elseif isequal(method, "chebyUniform")
    t = chebyPara(q, 0, 1, "uniform");
elseif isequal(method, "chebyChord")
    t = chebyPara(q, 0, 1, "chord");  
elseif isequal(method, "chebyCentri")
    t = chebyPara(q, 0, 1, "centri");
else
    error(['Invalid input! Expecting "uniform", "chord", ' ...
        '"centri", "chebyUniform", "chebyChord" or "chebyCentri"!']);
end

p = fitBezierCurve2(q, n, t, draw);

end