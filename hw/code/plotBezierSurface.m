function plotBezierSurface(p, u, v, polygon, method)
%PLOTBEZIERFACE Draw Bezier surface.
%   Input:
%       p: control pologon given in the form of a cell array.
%       u, v: parameter values.
%       polygon: true, plot control pologon, false otherwise. 
%                true by default.
%       method: "deCasteljau", de Casteljau algorithm; 'bernstein',
%           by bernstein basis functions. 'deCasteljau' by default.

if nargin <= 4
    method = "deCasteljau";
end

if nargin <= 3
    polygon = true;
end

if method == "deCasteljau"
    S = deCasteljau2(p, u, v);
elseif method == "bernstein"
    S = allBernstein2(p, u, v);
else
    error(['Invalid input! Expecting method either "deCasteljau" or ' ...
        '"bernstein" !']);
end

% extract x,y,z coordinates
[x, y, z] = cell2coord(S);

% plot Bezier surface
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
    legend('Bezier Surface','control polygon');
end
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on
view([40 30]);

end