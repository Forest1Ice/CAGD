function p = geomHermiteInterp(q, T, k0, k1)
%GEOMHERMITEINTERP Geometric Hermite interpolation.
%   Construct a cubic Bezier curve that interpolates position, tangent
%   and curvature.
%   Input:
%       q: endpoints given in a two dimensional row vector.
%       T: two dimensional endpoint unit tangent vectors.
%       k0, k1: curvatures at two endpoints.
%   Output:
%       p: control polygon

% Input check
T0 = T(:, 1);
T1 = T(:, 2);
if norm(T0) ~= 1 && norm(T1) ~= 1
    error('Invalid input! Expecting tangents are unit vectors!');
end

p = zeros(2, 4);
p(:, 1) = q(:, 1);
p(:, 4) = q(:, 2);

% interpolation equations
% D = Q1 - Q0
% P0 = Q0, P3 = Q1
% P1 = P0 + l0 * T0, P2 = Q1 - l1 * T1, l0, l1 > 0
% (T0 \times T1) * l0 = (D \times T1) - 3/2 * k1 * l1^2
% (T0 \times T1) * l1 = (T0 \times D) - 3/2 * k0 * l0^2

D = q(:, 2) - q(:, 1);
t01 = T0(1) * T1(2) - T0(2) * T1(1);
t0D = T0(1) * D(2) - T0(2) * D(1);
tD1 = D(1) * T1(2) - D(2) * T1(1);

% solve non-linear equations
fun = @(vars) [
    3/2 * k0 * vars(1)^2 + t01 * vars(2) - t0D;
    3/2 * k1 * vars(2)^2 + t01 * vars(1) - tD1;
];
options = optimoptions('fsolve');
x0 = [0, 0];
[solution, ~, exitflag] = fsolve(fun, x0, options);

if exitflag > 0 && (solution(1) > 0 && solution(2) > 0)
    p(:, 2) = p(:, 1) + solution(1) * T0;
    p(:, 3) = p(:, 4) - solution(2) * T1;
else
    error('Failure! Positive l0 and l1 not found!');
end

end