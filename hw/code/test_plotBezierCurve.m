% test function 'plotBezierCurve'

% parameters
t = 0:0.01:1;

% two dimension
p0 = [-1;0];
p1 = [0;1];
p2 = [0;-1];
p3 = [1;0];
p4 = [3;3];
p5 = [-2;1];
p = [p0,p1,p2,p3,p4,p5];

fig1 = plotBezierCurve(p, t);

% three dimension
p0 = [-1;0;0];
p1 = [0;2;1];
p2 = [0;-1;0];
p3 = [1;0;2];
p4 = [2;2;3];
p5 = [2;3;-1];
p = [p0,p1,p2,p3,p4,p5];

fig2 = plotBezierCurve(p, t);
