% test function 'plotBezierCurve'

% parameters
t = 0:0.01:1;

% two dimension
p0 = [-1;0];
p1 = [0;1];
p2 = [2;2];
p3 = [1;0];
p4 = [0;-1];
p = [p0,p1,p2,p3,p4];

fig1 = figure('Name', 'Two Dimension Bezier Curve with deCasteljau algorithm');
plotBezierCurve(p, t, true, "deCasteljau");
fig2 = figure('Name', 'Two Dimension Bezier Curve with bernstein algorithm');
plotBezierCurve(p, t, true, "bernstein");

% three dimension
p0 = [-1;0;0];
p1 = [0;2;1];
p2 = [2;2;3];
p3 = [1;0;2];
p4 = [0;-1;0];
p = [p0,p1,p2,p3,p4];

fig3 = figure('Name', 'Three Dimension Bezier Curve with deCasteljau algorithm');
plotBezierCurve(p, t, true, "deCasteljau");
fig4 = figure('Name', 'Three Dimension Bezier Curve with bernstein algorithm');
plotBezierCurve(p, t, true, "bernstein");
