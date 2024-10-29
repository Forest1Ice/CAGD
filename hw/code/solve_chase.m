function b = solve_chase(A, b)
%SOLVE_CHASE    Solve tridiagonal systems of equations using Thomas
%               algorithm.
%   Input:
%           A: tridiagonal matrix
%           b: rhs
%   Output:
%           x

n = length(A);

for k = 1:n-1
    A(k + 1, k) = A(k + 1, k) / A(k, k);
    A(k + 1, k + 1) = A(k + 1, k + 1) - A(k, k + 1) * A(k + 1, k);
end

% extract L and U, A = LU
L = eye(n) + tril(A, -1);
U = triu(A);

% forward
b = forward(L,b);
% backward
b = backward(U, b);

end