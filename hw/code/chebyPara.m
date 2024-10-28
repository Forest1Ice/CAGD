function t = chebyPara(q, l, u, method)
%CHEBYPARA Chebyshev parameterization for curve and surface fitting.
%   Inspired by the idea of Chebyshev interpolation, which can 
%   effectively eliminate the Runge phenominon and has nice fitting
%   property, this para method is in fact a modification of other 
%   parameterization methods.
%   Input:
%       q: data points to be fitted given in the form of row vector.
%       l,u: lower and upper of original parameter interval, e.g. [0,1].
%       method: "uniform", "chord", "centri"
%   Output:
%       new parameter vector. 

if nargin < 4
    method = "chord";
end

n = size(q,2);

% generate original para sequence
if isequal(method, "uniform")
    t = l:(u-l)/(n-1):u;
elseif isequal(method, "chord")
    t = chordPara(q);
    t = (u - l) * t + l;    % affine transform
elseif isequal(method, "centri")
    t = centriPara(q);
    t = (u - l) * t + l;    % affine transform
else
    error(['Invalid input! Expecting "uniform", "chord" ' ...
        'or "centri"!']);
end

% affine transform, convert l and u to n and 1, respectively
t = n - (t - l) / (u - l) * (n - 1);

% composite mapping and transform back to [l,u]. For uniform para,
% it is equivalent to assign n zeros of Chebyshev polynomial to the paras.
t = (u - l) * (cos((2*t-1)/(2*n)*pi) - cos((2*n-1)/(2*n)*pi)) / ...
    (cos(1/(2*n)*pi) - cos((2*n-1)/(2*n)*pi)) + l;

end