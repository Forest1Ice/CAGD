% test function 'plotBsplineSurface'

% knot vector
u = [0, 0, 0, 1/2, 1, 1, 1];    % du = 2
v = [0, 0, 0, 1, 1, 1];    % dv = 2

% control polygon
p = cell(3, 4);
p{1, 1} = [0; 0];
p{1, 2} = [0; 1];
p{1, 3} = [1; 1.5];
p{1, 4} = [3; 1.5];
p{2, 1} = [-1; 0];
p{2, 2} = [-1; 2];
p{2, 3} = [1; 4];
p{2, 4} = [3; 4];
p{3, 1} = [-2; 0];
p{3, 2} = [-2; 2];
p{3, 3} = [1; 5];
p{3, 4} = [3; 5];

% parameters
tu = 0:0.01:1;
tv = 0:0.01:1;

% 'plotBsplineSurface' function
fig = figure('Name', 'B-spline Surface');
plotBsplineSurface(p, u, v, tu, tv);
