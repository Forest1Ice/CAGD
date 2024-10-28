function B = allBernstein(n, u)
%BERNSTEIN Compute all values of Bernstein basis functions of degree n.
%   Input:
%       n: degree.
%       u: parameter in [0,1].
%   Output:
%       B:  values of n+1 Bernstein basis functions at u.

B = zeros(1, n+1);
B(1) = 1;

for j = 2:n+1
    saved = 0;
    for k = 1:j-1
        temp = B(k);
        B(k) = saved + (1 - u) * temp;
        saved = u * temp;
    end
    B(j) = saved;
end

end