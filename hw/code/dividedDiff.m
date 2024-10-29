function t = dividedDiff(p)
%DIVIDEDDIFF Compute divided differences table
%   Input:
%       p: two dimensional para-value pairs given in a row vector.
%   Output:
%       t: n divided differences, [f[x_1], f[x_1,x_2], ..., f[x_1, x_2,
%       ..., x_n]]

n = size(p, 2);
t = p(2, :);

for k = 2:n
    t(k:n) = (t(k:n) - t(k-1:n-1)) ./ (p(1, k:n) - p(1, 1:n-k+1));
end

end