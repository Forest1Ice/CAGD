function freeFormDeform_2d(m, n, u, v, p, interval)
%FREEFORMDEFORM_2D 2D free form deformation algorithm using linear
%   precision property of Bezier representation.
%   Input:
%       m, n: degree in u, v direction.
%       u, v: parameter values in the range of interval.
%       p:  control polygon in the format of a cell array.
%       interval: interval in u, v direction, [0, 1; 0, 1] by default.

if nargin < 6
    interval = [0, 1; 0, 1];
end

u_min = interval(1, 1);
u_max = interval(1, 2);
v_min = interval(2, 1);
v_max = interval(2, 2);

% input check
if min(u) < u_min || max(u) > u_max || min(v) < v_min || max(v) > v_max
    error('Invalid input! Expect paras lying in the range of interval!');
end

if length(u) ~= length(v)
    error('Invalid input! Expect length of u matches v!');
end

if nargin < 5
    p = cell(n + 1, m + 1);
    for i = 1:n + 1
        for j = 1:m + 1
            p{i, j} = [v_min + (j - 1) / n * (v_max - v_min);...
                u_min + (i - 1) / m * (u_max - u_min)];
        end
    end
end

S = [u; v];

% compute surface points
q = zeros(2, n + 1);
for k = 1:length(u)
    B = allBernstein(m, u(k));
    C = allBernstein(n, v(k));
    for i = 1:n + 1
        polygon = cell2mat(p(i, :));
        q(:, i) = sum(B .* polygon, 2);
    end
    S(:, k) = sum(C .* q, 2);
end

% plot figure
figure('Name', '2D Free-form Deformation');
hold on
plot(S(1, :), S(2, :), '-b');
% plot polygon
mat = cell2mat(p);
x = mat(1:2:end - 1, :);
y = mat(2:2:end, :);
for i = 1:size(x, 1)
    plot(x(i, :), y(i, :), 'r--.', 'MarkerSize', 10);
end
for j = 1:size(x, 2)
    plot(x(:, j), y(:, j), 'r--.', 'MarkerSize', 10);
end
x_min = min(x, [], 'all'); x_max = max(x, [], 'all');
y_min = min(y, [], 'all'); y_max = max(y, [], 'all');
xlim([x_min - 1/6 * (x_max - x_min), x_max + 1/6 * (x_max - x_min)])
ylim([y_min - 1/6 * (y_max - v_min), y_max + 1/6 * (y_max - y_min)])
xlabel('x')
ylabel('y')
axis equal
legend('Free-form Curve','control polygon');

end