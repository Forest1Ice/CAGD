% test function 'plotBezierSurface'

% control polygon
p = cell(3, 4);
p{1, 1} = [2; 0; 1];
p{1, 2} = [1; 0; 2];
p{1, 3} = [0; 0; 1];
p{1, 4} = [-1; 0; 2];
p{2, 1} = [2; 1; 1];
p{2, 2} = [1; 1; 2];
p{2, 3} = [0; 1; 1];
p{2, 4} = [-1; 1; 2];
p{3, 1} = [2; 2; 1];
p{3, 2} = [1; 2; 2];
p{3, 3} = [0; 2; 1];
p{3, 4} = [-1; 2; 2];

% parameters
u = 0:0.01:1;
v = 0:0.01:1;

% 'plotBezierSurface' function
fig1 = figure('Name', 'Bezier Surface with deCasteljau algorithm');
plotBezierSurface(p, u, v, true, "deCasteljau");
fig2 = figure('Name', 'Bezier Surface with bernstein algorithm');
plotBezierSurface(p, u, v, true, "bernstein");