function  x = deCasteljau(p, t)
%DECASTELJAU de Casteljau算法计算Bezier曲线上的点
%   Input:  
%         p: control pologon given in a row vector of points.
%         t: parameter value in [0,1].
%   Output: 
%         x: point of Bezier curve at t.

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