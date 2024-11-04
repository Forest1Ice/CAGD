function plotBezierCurve(p, t, polygon, method)
%PLOTBEZIERCURVE Draw Bezier curve
%   Input:
%         p: control pologon given in a row vector of points.
%         t: parameter values.
%         polygon: true, plot control pologon, false otherwise. 
%                  true by default.
%         method: "deCasteljau", de Casteljau algorithm; 'bernstein',
%         by bernstein basis functions. 'deCasteljau' by default.

if nargin <= 3
    method = "deCasteljau";
end

if nargin <= 2
    polygon = true;
end

[m, ~] = size(p);   % dimension
n = length(t);
x = zeros(m, n);

if method == "deCasteljau"
    for i = 1:n
        x(:, i) = deCasteljau(p, t(i));
    end
elseif method == "bernstein"
    
else
    error(['Invalid input! Expecting method either "deCasteljau" or ' ...
        '"bernstein" !']);
end

% plot Bezier curve
hold on
if m == 2   % two dimension
    plot(x(1,:), x(2,:), '-b');
    if polygon
        plot(p(1,:), p(2,:), 'r--.', 'MarkerSize', 10);
        legend('Bezier curve','control polygon');
    end
elseif m == 3   % three dimension
    plot3(x(1,:), x(2,:), x(3,:), '-b');
    if polygon
        plot3(p(1,:), p(2,:), p(3,:), 'r--.', 'MarkerSize', 10);
        legend('Bezier curve','control polygon');
    end
    grid
    view([-80 30]);
else
    error('Invalid input! Expecting dimension of points either 2 or 3!');
end

end