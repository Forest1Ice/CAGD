function b = forward(L,b)
%FORWARD 前向消元
%   对于下三角矩阵L，求解 Ly=b.

[~,n] = size(L);
for k = 1:n-1
    b(k) = b(k) / L(k,k);
    b(k+1:n) = b(k+1:n) - b(k) * L(k+1:n, k);
end
b(n) = b(n) / L(n,n);
end