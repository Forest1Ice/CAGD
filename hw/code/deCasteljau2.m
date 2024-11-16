function S = deCasteljau2(p, u, v)
%DECASTELIAU2 Use de Casteljau algorithm to compute points on Bezier Surface.
%   Input:
%       p:  control pologon given in the form of a cell array.
%       u, v:   parameter values in [0,1].
%   Output:
%       S: points on the surface in the form of a of a cell array.

[m, n] = size(p);
s = length(u);
t = length(v);
S = cell(s, t);

% For efficiency, we choose different computing orders based on sizes
% of m and n.
if m <= n
    % Compute C_{u0}(v) first
    q = zeros(3, n);
    for j = 1:s
        for k = 1:t
            for i = 1:n
                polygon = cell2mat(p(:, i)');
                q(:, i) = deCasteljau(polygon, u(j));
            end
            S{j, k} = deCasteljau(q, v(k));
        end
    end    
else
    % Compute C_{v0}(u) first
    q = zeros(3, m);
    for j = 1:s
        for k = 1:t
            for i = 1:m
                polygon = cell2mat(p(i, :));
                q(:, i) = deCasteljau(polygon, v(k));
            end
            S{j, k} = deCasteljau(q, u(j));
        end
    end
end

end