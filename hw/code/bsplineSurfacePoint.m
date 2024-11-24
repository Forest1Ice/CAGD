function S = bsplineSurfacePoint(p, u, v, tu, tv)
%PLOTBSPLINESURAFCE Draw B-spline surface.
%   Input:
%       p: control pologon given in the form of a cell array.
%       u, v: knot vector in u, v direction.
%       tu, tv: parameter values.
%   Output:
%       S: points on the surface in the form of a of a cell array.

[m, n] = size(p);
du = length(u) - n - 1;
dv = length(v) - m - 1;
s = length(tu);
t = length(tv);
S = cell(t, s);
q = zeros(3, m);

for i = 1:t
    vspan = findSpan(dv, tv(i), v);
    Nv = basisFuncs(vspan, tv(i), dv, v);
    for j = 1:s
        uspan = findSpan(du, tu(j), u);
        Nu = basisFuncs(uspan, tu(j), du, u);
        for k = 1:m
            polygon = cell2mat(p(k, uspan - du: uspan));
            q(:, k) = sum(Nu .* polygon, 2);
        end
        S{i, j} = sum(Nv .* q(:, vspan - dv: vspan), 2);
    end
end

end