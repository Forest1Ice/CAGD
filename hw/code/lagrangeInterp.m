function y = lagrangeInterp(q, x, method)
%LAGRANGEINTERP Lagrange interpolation curve
%   Input:
%       q: sample data given in a row vector of points.
%       x: paras to be evaluated.
%       method: para method, "uniform", "chord", "centripetal",
%                   "chebyUniform", "chebyChord", "chebyCentri"
%  Output:
%       y: evaluated points of interpolation curve on x.

if nargin < 3
    method = "chebyChord";
end

[m, n] = size(q);   % dimension
s = length(x);
y = zeros(m, s);

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

% Aitken algorithm
for k = 1:s
    temp = q;
    for r = 1:n-1
        for i = 1:n-r
            temp(:, i) = (t(i + r) - x(k)) / (t(i + r) - t(i)) * temp(:, i)...
                + (x(k) - t(i)) / (t(i + r) - t(i)) * temp(:, i + 1);
        end
    end
    y(:, k) = temp(:, 1); 
end

% draw figure
if m == 2
    figure('Name', "2-D Lagrange Interpolation Curve" );
    plot(y(1, :), y(2, :), '-b', q(1,:), q(2,:), 'r.', 'MarkerSize', 10);
elseif m == 3
    figure('Name', "3-D Lagrange Interpolation Curve" );
    plot3(y(1, :), y(2, :), y(3, :), '-b', q(1,:), q(2,:), q(3, :), ...
        'r.', 'MarkerSize', 10);
    grid
    view([-80 30]);
end
legend('Lagrange interpolation curve', 'data points');

end