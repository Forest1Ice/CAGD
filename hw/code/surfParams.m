function [u, v] = surfParams(q, method)
%SURFPARAMS Compute params for global surface interpolation.
%   Refer to algorithm 9.3 of NURBS book.
%   Input:
%       q: sample data points given in the form of a cell array.
%       method: para method, "chord", "chebyChord", "chebyChord" by default.
%   Output:
%       u, v: parameter values of sample data points in [0,1].

if nargin < 2
    method = "chebyChord";
end

% input check
if ~(isequal(method, "chord") || isequal(method, "chebyChord"))
    error('Invalid input! Expecting method "chord" or "chebyChord"!');
end

[m, n] = size(q);
u = zeros(1, n);
v = zeros(1, m);

% compute u_k first
num = m;    % number of non-degenerated rows
if isequal(method, "chord")
    for i = 1:m
        u = u + chordPara(cell2mat(q(i, :)));
        if ~u(end)  % u(end) == 0, i.e. the total chord length is 0
            num = num - 1;
        end
    end
else
    for i = 1:m
        u = u + chebyPara(cell2mat(q(i, :)), 0, 1, "chord");
        if ~u(end)  % u(end) == 0, i.e. the total chord length is 0
            num = num - 1;
        end
    end
end

if num
    u = u / num;
else
    % all rows are degerated, actually a curve interpolation
    error('Invalid input! Expect data points not all denerated rows!');
end

% compute v_l similarly
num = n;    % number of non-degenerated cols
if isequal(method, "chord")
    for i = 1:n
        v = v + chordPara(cell2mat(q(:, i)'));
        if ~v(end)  % v(end) == 0, i.e. the total chord length is 0
            num = num - 1;
        end
    end
else
    for i = 1:n
        v = v + chebyPara(cell2mat(q(:, i)'), 0, 1, "chord");
        if ~v(end)  % v(end) == 0, i.e. the total chord length is 0
            num = num - 1;
        end
    end
end

if num
    v = v / num;
else
    % all cols are degerated, actually a curve interpolation
    error('Invalid input! Expect data points not all denerated cols!');
end

end