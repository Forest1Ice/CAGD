function t = centriPara(q)
%CENTRIPARA Centripetal parameterization for curve and surface fitting.
%   Input:
%       q: data points to be fitted given in the form of row vector
%   Output:
%       t: parameter vector of data points.

n = size(q, 2);

t = zeros(1,n);
t(2:n) = sqrt(vecnorm(q(:,2:n) - q(:,1:n-1)));
t(2:n) = t(2:n) / sum(t(2:n));  % ratio of each chord length
t = cumsum(t);

end