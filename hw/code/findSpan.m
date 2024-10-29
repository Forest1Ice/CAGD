function mid = findSpan(p,u,U)
%FINDSPAN Find index of knot span where the parameter is in.
%   Use bisection method to search.
%   Input:
%           p: degree.
%           u: parameter
%           U: b-spline knot vector
%   Output:
%           mid: index

m = length(U);
n = m - p - 1;  % number of basis functions of p degree

if u == U(n+1)
    mid = n;
    return
end

% bisection search
low = p + 1;
high = n + 1;
mid = floor((low + high) / 2);

while u < U(mid) || u >= U(mid + 1)
    if u < U(mid)
        high = mid;
    else
        low = mid + 1;
    end
    mid = floor((low + high) / 2);
end

end