function  x = deCasteljau(p, t)
%DECASTELJAU Use de Casteljau algorithm to compute the point on Bezier curve.
%   Input:  
%         p: control pologon given in a row vector of points.
%         t: parameter value in [0,1].
%   Output: 
%         x: point on Bezier curve at t.

% number of control points
[~, n] = size(p);

% de Casteljau algorithm
for k = 1:n-1
    for i = 1:n-k
        p(:, i) = (1.0 - t) * p(:, i) + t * p(:, i + 1);
    end
end

x = p(:,1);

end