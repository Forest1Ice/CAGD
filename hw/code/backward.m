function y = backward(U,y)
%BACKWARD 反向回代
%  U为上三角矩阵，求解 Ux = y.

[~, n] = size(U);

for k = n:-1:2
    y(k) = y(k) / U(k,k);
    y(1:k-1) = y(1:k-1) - y(k) * U(1:k-1,k);
end
y(1) = y(1) / U(1,1);
end