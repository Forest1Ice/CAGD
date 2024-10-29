function mid = findInterval(x, t)
%FINDINTERVAL Find the index of interval containing the para in a strictly
%             increasing sequence {x_1 < x_2 < ...< x_n}.
%   Use bisection method to search.
%   Input:
%           x: a strictly increasing knot vector
%           t: parameter
%   Output:
%           mid: index

if isempty(x) || t < x(1)
    mid = 0;
    return;
elseif t > x(end)
    mid = length(x);
    return;
elseif t == x(end)
    mid = length(x) - 1;
    return;
end

low = 1;              
high = length(x);
mid = floor((low + high) / 2);

% bisection search
while t < x(mid) || t >= x(mid + 1)
    if t < x(mid)
        high = mid;
    else
        low = mid + 1;
    end
    mid = floor((low + high) / 2);
end

end