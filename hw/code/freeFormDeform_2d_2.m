function freeFormDeform_2d_2(m, n, u, v, interval)
%FREEFORMDEFORM_2D 2D free form deformation algorithm using linear
%   precision property of Bezier representation.
%   Input:
%       m, n: degree in u, v direction.
%       u, v: parameter values in the range of interval.
%       interval: interval in u, v direction, [0, 1; 0, 1] by default.

if nargin < 5
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

hPoints = cell(n + 1, m + 1);
S = [u; v];

% initial plot
figure('Name', '2D Free-form Deformation');
hold on
hCurve = plot(S(1, :), S(2, :), '-b');
xlim([u_min - 1/6 * (u_max - u_min), u_max + 1/6 * (u_max - u_min)])
ylim([v_min - 1/6 * (v_max - v_min), v_max + 1/6 * (v_max - v_min)])
xlabel('u')
ylabel('v')
axis equal
legend('Free-form Curve','control polygon');

% compute control polygon
for i = 1:n + 1
    for j = 1:m + 1
        v_coord = v_min + (j - 1) / n * (v_max - v_min);
        u_coord = u_min + (i - 1) / m * (u_max - u_min);
        hPoints(i, j) = plot(u_coord, v_coord, '.', 'MarkerSize', 12, 'ButtonDownFcn', ...
            @(src, event) drag_point(src, event, hCurve, hPoints));
    end
end

% mat = cell2mat(p);
% x = mat(1:2:end - 1, :);
% y = mat(2:2:end, :);
% for i = 1:size(x, 1)
%     hLines()plot(x(i, :), y(i, :), 'r--');
% end
% for j = 1:size(x, 2)
%     plot(x(:, j), y(:, j), 'r--');
% end

end

function drag_point(src, ~, hCurve, hPoints)
    hFig = ancestor(hCurve, 'figure');
    set(hFig, 'WindowButtonMotionFcn', @(~, ~) move_point(src, hCurve, hPoints));
    set(hFig, 'WindowButtonUpFcn', @(~, ~) stop_dragging(hFig));
end

function move_point(hPoint, hCurve, hPoints)
    % 获取鼠标当前位置
    currPoint = get(gca, 'CurrentPoint');
    newX = currPoint(1, 1);
    newY = currPoint(1, 2);
    
    % 更新点的位置
    hPoint.XData = newX; 
    hPoint.YData = newY;
    
    % 动态更新曲线
    x = get(hCurve, 'XData');
    y = get(hCurve, 'YData');
    
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

    set(hCurve, 'YData', y);
end

function stop_dragging(hFig)
    set(hFig, 'WindowButtonMotionFcn', []);
    set(hFig, 'WindowButtonUpFcn', []);
end