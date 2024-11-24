function p = fitBezierCurve2(q, n, t, draw)
%SMOOTHFITBEZIERCURVE Bezier curve fitting.
%   Use least square method to fit given data points with Bezier curve.
%   Input:
%           q: sample data given in a row vector of points.
%           n: degree.
%           t: parameter values.
%           draw: whether plot the figure, false by default.
%   Output:
%           p: control pologon given in a row vector of points.
%   LS:     min ||Mp - q||_2.

if nargin < 4
    draw = false;
end

[m, d] = size(q);   % dimension

N = length(t);
M = zeros(N, n+1);  % each row is a vector of n+1 Bernstein values for t_i
p = zeros(m, n+1);

% compute coefficient matrix
for i = 1:N
    M(i, :) = allBernstein(n, t(i));
end

% solve normal equation for each dimension
if n == d-1
    % if the number of samples is one more than the degree, interpolate
    % directly.
    for k = 1:m
        x = M \ q(k, :)';
        p(k, :) = x';
    end
else
    % we use normal equation to solve LS problem here, rather than 
    % QR decompsition, because it is easy to obtain ||M||_{\infty} = 1
    % by the weight property of Bernstein basis functions.
    A = M' * M ;
    for k = 1:m
        b = M' * q(k, :)';
        x = A \ b;      
        p(k, :) = x';
    end 
end

% plot Bezier curve and data points
if draw
    if n == d-1
        figure('Name', "Bezier Curve Interpolation");
    else
        figure('Name', "Bezier Curve Fitting");
    end
    plotBezierCurve(p, 0:0.01:1, false);
    if m == 2
        plot(q(1,:), q(2,:), 'r.', 'MarkerSize', 10);
    elseif m == 3
        plot3(q(1,:), q(2,:), q(3, :), 'r.', 'MarkerSize', 10);
    end
    legend("Bezier curve", "Sample data");
end

end