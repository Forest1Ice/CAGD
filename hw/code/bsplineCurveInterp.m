function p = bsplineCurveInterp(q, d, draw, method)
%BSPLINECURVEINTERP B-spline curve interpolation.
%   Input: 
%       q: sample data given in a row vector of points.
%       d: degree.
%       draw: whether plot the figure, false by default.
%       method: para method, "uniform", "chord", "centripetal",
%               "chebyUniform", "chebyChord", "chebyCentri",
%               "chebyChord" by default.
%   Output:
%           p: control pologon given in a row vector of points.

if nargin < 4
    method = "chebyChord";
end

if nargin < 3
    draw = true;
end

n = size(q, 2);

% generate para sequence
if isequal(method, "uniform")
    t = 0:1/(n-1):1;
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

p = bsplineCurveInterp2(q, d, t, draw);

end