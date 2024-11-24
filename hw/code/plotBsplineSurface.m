function plotBsplineSurface(p, u, v, tu, tv, polygon)
%PLOTBSPLINESURAFCE Draw B-spline surface.
%   Input:
%       p: control pologon given in the form of a cell array.
%       u, v: knot vector in u, v direction.
%       tu, tv: parameter values.
%       polygon: true, plot control pologon, false otherwise. 
%                true by default.

if nargin < 6
    polygon = true;
end

% compute points on the surface
S = bsplineSurfacePoint(p, u, v, tu, tv);

% extract x,y,z coordinates
[x, y, z] = cell2coord(S);

% plot B-spline surface
hold on
surf(x, y, z, EdgeColor = "none", FaceColor = "blue");
if polygon
    [x, y, z] = cell2coord(p);
    for i = 1:size(x, 1)
        plot3(x(i, :), y(i, :), z(i, :), 'r--.', 'MarkerSize', 10);
    end
    for j = 1:size(x, 2)
        plot3(x(:, j), y(:, j), z(:, j), 'r--.', 'MarkerSize', 10);
    end
    legend('B-spline Surface','control polygon');
end
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on
view([40 30]);

end