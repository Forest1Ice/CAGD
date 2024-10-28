function fig = FitBezierCurve(q, n, method)
%SMOOTHFITBEZIERCURVE Bezier curve fitting.
%   Use least square method to fit given data points with Bezier curve.
%   Input:
%           q: sample data given in a row vector of points.
%           n: degree.
%           method: para method, "uniform", "chord", "centripetal",
%                   "chebyUniform", "chebyChord", "chebyCentri"
%   Output:
%           p: control pologon given in a row vector of points.
%   LS:     min ||Mp - q||_2.

if nargin < 3
    method = "chebyChord";
end

[m, d] = size(q);   % dimension

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

N = length(t);
M = zeros(N, n+1);  % each row is a vector of n+1 Bernstein values for t_i
p = zeros(m, n+1);

% compute coefficient matrix
for i = 1:N
    M(i, :) = allBernstein(n, t(i));
end

% we use normal equation to solve LS problem here, rather than 
% QR decompsition, because it is easy to obtain ||M||_{\infty} = 1
% by the weight property of Bernstein basis functions.
% solve normal equation for each dimension
for k = 1:m
    b = M' * q(k, :)';
    x = M' * M \ b;        
    p(k, :) = x';
end

% plot Bezier curve and data points
fig = plotBezierCurve(p, 0:0.01:1, false);
if m == 2
    plot(q(1,:), q(2,:), 'r.', 'MarkerSize', 10);
elseif m == 3
    plot3(q(1,:), q(2,:), q(3, :), 'r.', 'MarkerSize', 10);
end
legend("Bezier curve", "Sample data");
set(fig, 'Name', "Bezier Curve Fitting");

end