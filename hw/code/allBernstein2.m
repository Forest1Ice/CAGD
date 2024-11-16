function S = allBernstein2(p, u, v)
%ALLBERNSTEIN2 Use Bernstein algorithm to compute points on Bezier surface.
%   Input:
%       p:  control pologon given in the form of a cell array.
%       u, v:   parameter values in [0,1].
%   Output:
%       S: points on the surface in the form of a of a cell array.

[m, n] = size(p);
s = length(u);
t = length(v);
S = cell(s, t);
q = zeros(3, m);

for j = 1:s
    for k = 1:t
        B = allBernstein(n - 1, v(k));
        C = allBernstein(m - 1, u(j));
        for i = 1:m
            polygon = cell2mat(p(i, :));
            q(:, i) = sum(B .* polygon, 2);
        end
        S{j, k} = sum(C .* q, 2);
    end
end

end