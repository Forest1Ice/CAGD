% test function 'geomHermiteInterp'

% approximate a unit circle with different number of points
n = [4, 8, 16, 32];
k = 1;
q = zeros(2, 2);
T = zeros(2, 2);
t = 0:0.01:1;
err = zeros(1, length(n));

for i = 1:length(n)
    k = n(i);
    figure('Name', "n = " + num2str(k))
    axis equal;
    % compute tangent vectors
    for j = 0:k-1
        q(1, :) = cos(2*pi/k * (j:j+1));
        q(2, :) = sin(2*pi/k * (j:j+1));
        T(1, :) = -sin(2*pi/k * (j:j+1));
        T(2, :) = cos(2*pi/k * (j:j+1));
        p = geomHermiteInterp(q, T, k, k);
        plotBezierCurve(p, t, false);
        if i <= 2
            plot(p(1,:), p(2,:), 'g--.', 'MarkerSize', 10);
        end
    end
    plot(cos(2*pi/k * (0:k-1)), sin(2*pi/k * (0:k-1)), 'r.', 'MarkerSize', 10);
end
