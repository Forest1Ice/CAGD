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
left = zeros(1, p);

for j = 1:p
    left(j + 1) = u - U(i + 2 - j);
    
end

end