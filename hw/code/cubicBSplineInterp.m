function [u, p] = cubicBSplineInterp(q, x, D1, D2, method)
%CUBICBSPLINEINTERP Cubic B-spline curve interpolation with first boundary 
%                   conditions.
%   Input: 
%       q: data points given in a row vector.
%       x: paras to be evaluated.
%       method: para method, "uniform", "chord", "centripetal",
%                   "chebyUniform", "chebyChord", "chebyCentri"
%   Output:
%       u: knot vector
%       p: control pologon of B-spline curve.

if nargin < 5
    method = "chebyChord";
end

[m, n] = size(q);   % dimension
p = zeros(m, n + 2); % number of control points is two more than data points
p(:, 1) = q(:, 1); p(:, end) = q(:, end); % end-points interpolation
N = zeros(n, n);
b = zeros(n, 1);

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

% knot vector
u = [zeros(1, 4), t(2:n - 1), ones(1, 4)];

% coefficient matrix
% only three non-zero basis functions exist for each interior knot
N(1, 1) = 3 / t(2);
N(n, n) = 3/ (1 - t(n - 1));
for i = 1:n - 2
    temp = basisFuncs(i + 4, u(i + 4), 3, u);
    N(i + 1, i:i + 2) = temp(1:3);
end
% RHS
for k = 1:m
    b(1) = N(1, 1) * q(k, 1) + D1(k);
    b(n) = N(n, n) * q(k, n) - D2(k);
    for i = 1:n-2
        b(i + 1) = q(k, i + 1);
    end
    b = solve_chase(N, b);
    p(k, 2:n + 1) = b';
end

% draw figure
plotBsplineCurve(3, u, p, x, false);
if m == 2
    plot(q(1,:), q(2,:), 'r.', 'MarkerSize', 10);
    quiver([q(1, 1), q(1, n)], [q(2, 1), q(2, n)], ...
        [D1(1), D2(1)], [D1(2), D2(2)], 'g', 'LineWidth', 1);
elseif m == 3
    plot3(q(1,:), q(2,:), q(3, :), 'r.', 'MarkerSize', 10);
    quiver([q(1, 1), q(1, n)], [q(2, 1), q(2, n)], [q(3, 1), q(3, n)], ...
        [D1(1), D2(1)], [D1(2), D2(2)], [D1(3), D2(3)], 'g', 'LineWidth', 1);
end
legend("B-spline curve", "Sample data", "Endpoint tangent vector");

end