% test function 'deCasteljau'

% control points
p0 = [-1;0;0];
p1 = [0;2;1];
p2 = [0;-1;0];
p3 = [1;0;2];
p4 = [2;2;3];
p5 = [2;3;-1];
p = [p0,p1,p2,p3,p4,p5];

% 'deCasteljau' function
x1 = deCasteljau(p, 0);
x2 = deCasteljau(p, 1);

% check whether x1 == p0 or x2 == p5
if isequal(x1, p0) && isequal(x2, p5)
    disp('Success! deCasteljau algorithm is correct!');
else
    disp('Failure! deCasteljau algorithm is wrong!');
end