% test function 'basisFuncs'

p = 2;
U = [0, 0, 0, 1, 2, 3, 4, 4, 5, 5, 5, 5];
u = 5/2;

% find index of span
i = findSpan(p, u, U);
% compute  all non-zero B-spline basis functions at u
N = basisFuncs(i, u, p, U);

% check whether the result is correct
if N(1) == 1/8 && N(2) == 6/8 && N(3) == 1/8
    disp('Success! basisFuncs algorithm is correct!');
else
    disp('Failure! basisFuncs algorithm is wrong!');
end