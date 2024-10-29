% test function 'cubicSpline'

% Runge function, on on [-1,1]
f = @(x) 1 ./ (1 + 25 * x.^2);
% number of knot vector
n = [6, 11, 21, 41, 81];
% paras to be estimated
x = -1:0.01:1;

% plot figure
lines = [":", ":", "--", "--", "-."];
hold on
for k = 1:length(n)
    t = -1:2/(n(k)-1):1;
    q = [t; f(t)];
    y = cubicSpline(q, x, ["first", 25/338, -25/338]);
    plot(x, y, lines(k));
end
plot(x,f(x), '-', LineWidth = 1);
legend([...
    "N = " + string(num2str(6)), ...
    "N = " + string(num2str(11)), ...
    "N = " + string(num2str(21)), ...
    "N = " + string(num2str(41)), ...
    "N = " + string(num2str(81)), ...
    "$f(x) = \frac{1}{1+25x^2}$" ...
], 'Interpreter', 'latex');
title('Cubic Spline Interpolation Eliminates Runge Phenomenon');
hold off