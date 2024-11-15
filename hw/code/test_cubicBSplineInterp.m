% test function 'cubicBSplineInterp'

x = 0:0.01:1;

% two dimension
q0 = [-1;0];
q1 = [0;1];
q2 = [3;3];
q3 = [1;0];
q4 = [0;-1];
q = [q0,q1,q2,q3,q4];

% generate boundary tangent vectors in the way of Nurbs book(p263, Chinese)
n = size(q, 2);
t = zeros(1,n);
t(2:n) = vecnorm(q(:,2:n) - q(:,1:n-1));
d = sum(t(2:n)); % total chord length
D1 = [sqrt(2)/2; sqrt(2)/2] * d;
D2 = [-sqrt(2)/2; -sqrt(2)/2] * d;

% uniform para method
cubicBSplineInterp(q, x, D1, D2, "uniform");
% chord para method
cubicBSplineInterp(q, x, D1, D2, "chord");
% chebyChord para method
cubicBSplineInterp(q, x, D1, D2, "chebyChord");
