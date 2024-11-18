function fig = plotEllipsoid(a, b, c)
%PLOTELLIPSOID Draw standard ellisoid
%   Input:
%       a, b, c: half -axis length of ellipsoid.
%   Output:
%       fig: figure.

% polar coordinate parameterization
% x = asin{s}cos{t}, y = bsin{s}sin{t}, z = ccos{s}

% rational parametric form of ellipsoid
[u, v] = meshgrid(linspace(-1, 1, 100), linspace(-1, 1, 100));

x = (2 * a * u .* (1 - v.^2)) ./ ((1 + u.^2) .* (1 + v.^2));
y = (4 * b * u .* v) ./ ((1 + u.^2) .* (1 + v.^2));
z1 = c * (1 - u.^2) ./ (1 + u.^2); % upper-half plane
z2 = -z1; % lower-half plane

% draw
fig = figure('Name', 'Rational Parametric Form of Ellipsoid');
hold on;
surf(x, y, z1, EdgeColor = "none");
surf(x, y, z2, EdgeColor = "none");
xlabel('x'); ylabel('y'); zlabel('z');
axis equal;
grid on
view([40 30]);

end