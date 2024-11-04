function y = cubicSpline(q, x, boundary, draw)
%CUBICSPLINE Interpolate given data points using cubic spline polynomials.
%  Input:
%       q: two dimensional data points given in a row vector, where the
%       first row is a strictly increasing sequence.
%       x: paras to be evaluated.
%       boundary: boundary condition, given in the string vector form, 
%                 the first entry is chosen in "first", "second" or "natural",
%                 while the last are specified values, which are not needed
%                 for "natural" class.
%       draw: whether to draw figure, false in default.
%  Output:
%       y: evaluated values of cubic spline on x.

if nargin < 4
    draw = false;
end

n = size(q, 2);
row1 = q(1, :);
row2 = q(2, :);
M = zeros(n, 1);
s = length(x);
y = zeros(1, s);

% use M-method
% u_i M_{i-1} + 2 M_i + r_i M_{i+1} = 6 f[x_{i-1},x_{i}, x_{i+1}], i =
% 2,...,n-1

if boundary(1) == "natural" || boundary(1) == "second"
    % coefficient matrix
    % u_i = (x_i - x_{i-1}) / (x_{i+1} - x_{i-1})
    % r_i = (x_{i+1} - x_i) / (x_{i+1} - x_{i-1})
    u = (row1(3:n-1) - row1(2:n-2)) ./ (row1(4:n) - row1(2:n-2)); % u_3,..., u_{n-1}
    r = (row1(3:n-1) - row1(2:n-2)) ./ (row1(3:n-1) - row1(1:n-3)); % r_2, ..., r_{n-2}
    A = eye(n - 2) * 2 + diag(u, -1) + diag(r, 1);
    
    % rhs
    b = zeros(n-2, 1);
    for i = 1:n-2
        temp = q(:, i:i+2);
        t = dividedDiff(temp);
        b(i) = 6 * t(3);
    end
    if boundary(1) == "second"
        if length(boundary) ~= 3
            error('Invalid input! Expecting para number of boundary is 3!');
        end
        b(1) = b(1) - (row1(2) - row1(1)) / (row1(3) - row1(1)) * str2double(boundary(2));
        b(n - 2) = b(n - 2) - (row1(n) - row1(n-1)) / (row1(n) - row1(n-2)) * str2double(boundary(3));
        M(1) = boundary(2);
        M(n) = boundary(3); 
    end
    
    % solve equation using shooting method, because A is a strictly diagonally-dominant matrix
    M(2:n-1) = solve_chase(A, b);
    
elseif boundary(1) == "first"
    if length(boundary) ~= 3
        error('Invalid input! Expecting para number of boundary is 3!');
    end
     % coefficient matrix
     % u_i = (x_i - x_{i-1}) / (x_{i+1} - x_{i-1})
     % r_i = (x_{i+1} - x_i) / (x_{i+1} - x_{i-1})
     u = (row1(2:n-1) - row1(1:n-2)) ./ (row1(3:n) - row1(1:n-2)); % u_2,..., u_{n-1}
     r = (row1(3:n) - row1(2:n-1)) ./ (row1(3:n) - row1(1:n-2)); % r_2, ..., r_{n-1}
     A = eye(n) * 2 + diag([u, 1], -1) + diag([1, r], 1);
    
    % rhs
    b = zeros(n, 1);
    for i = 2:n-1
        temp = q(:, i-1:i+1);
        t = dividedDiff(temp);
        b(i) = 6 * t(3);
    end
    % b(1) = f[x_1,x_1,x_2]
    b(1) = 6 * ((row2(2) - row2(1)) / (row1(2) - row1(1)) - str2double(boundary(2))) / (row1(2) - row1(1));
    % b(n) = f[x_{n-1},x_n,x_n]
    b(n) = 6 * (str2double(boundary(3)) - (row2(n) - row2(n - 1)) / (row1(n) - row1(n - 1))) / (row1(n) - row1(n - 1));

    % solve equation using shooting method, because A is a strictly diagonally-dominant matrix
    M = solve_chase(A, b);
else
    error(['Invalid input! Expecting boundary condition "first", ' ...
        '"natural" or "second"!']);
end

% find span of each para
for k = 1:s
    index = findInterval(row1, x(k)); % find index of interval
    % s(x) = M_i*(x_{i+1}-x)^3/(6h_{i+1}) + M_i*(x-x_i)^3/(6h_{i+1}) 
    % + (y_i/h_{i+1} - h_{i+1}*M_i/6)*(x_{i+1}-x) 
    % + (y_{i+1}/h_{i+1}-h_{i+1}*M_{i+1}/6)(x-x_i)
    first = (row2(index + 1) - row2(index)) / (row1(index + 1) - row1(index))... 
            - 1/6 * (M(index + 1) + 2 * M(index)) * (row1(index + 1) - row1(index));
    third = (M(index + 1) - M(index)) / (row1(index + 1) - row1(index));
    y(k) = row2(index) + first * (x(k) - row1(index)) + M(index) / 2 * (x(k) - row1(index))^2 ...
            + third / 6 * (x(k) - row1(index))^3;
end

% draw cubic spline figure
if draw
    figure('Name', "Cubic Spline Interpolation Polynomial" );
    plot(x, y, '-b', row1, row2, 'r.', 'MarkerSize', 10);
    legend('cubic spline with ' + boundary(1) ...
        + ' boundary condition', 'data points');
end

end