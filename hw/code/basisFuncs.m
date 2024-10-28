function N = basisFuncs(i, u, p, U)
%BASISFUNCS Compute all non-zero B-spline basis functions at u. 
%   Input:
%           i: index of the knot span
%           u: parameter
%           p: degree
%           U: knot vector
%   Output:
%           N: p+1 function values at u in the form of row vector.

N = zeros(1, p+1);
N(1) = 1;
left = zeros(1, p + 1);
right = zeros(1, p + 1);

for j = 1:p
    left(j + 1) = u - U(i + 1 - j);
    right(j + 1) = U(i + j) - u;
    saved = 0.0;
    for r = 0:j-1
        temp = N(r + 1) / (right(r + 2) + left(j - r + 1));
        N(r + 1) = saved + right(r + 2) * temp;
        saved = left(j - r + 1) * temp;
    end
    N(j + 1) = saved;
end
    
end