function C = horner1(a, t, draw)
%HONOR1 Compute power basis polynomial
%   Use Horner algorithm to compute points on power basis polynomial curve.
%   Input:
%       a:  Coefficients with the same dimension(1, 2, 3, ...) in the form
%       of row vector by the order from 0 degree to n.
%       t:  Parameters to be evaluated on.
%       draw: Whether to plot the curve, false by default. And the
%       dimension can be only 1, 2 or 3.
%   Output:
%       C:  Points on the curve.

if nargin < 3
    draw = false;
end

[m, p] = size(a);
n = p - 1;   % degree

s = length(t);
C = zeros(m, s);

for i = 1:s
    u = t(i);
    C(:, i) = a(:, n + 1);
    for j = n:-1:1
        C(:, i) = C(:, i) * u + a(:, j);
    end
end

% Draw the curve
if draw
    % check the dimension
    if m == 1
        plot(t, C, '-b');
    elseif m == 2
        plot(C(1, :), C(2, :), '-b');
    elseif m == 3
        plot3(C(1, :), C(2, :), C(3, :), '-b');
        grid
        view([-80 30]);
    else
        error("Invaild input! Expecting the dimension 1, 2 or 3!");
    end
end

end