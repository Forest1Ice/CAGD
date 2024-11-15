% test function 'lagrangeInterp'

x = 0:0.01:1;

% two dimension
p0 = [-1;0];
p1 = [0;1];
p2 = [3;3];
p3 = [1;0];
p4 = [0;-1];
p = [p0,p1,p2,p3,p4];

% % uniform para method
lagrangeInterp(p, x, 'uniform');
% % chord para method
lagrangeInterp(p, x, 'chord');
% chebyChord para method
lagrangeInterp(p, x, 'chebyChord');

% three dimension
p0 = [-1;0;0];
p1 = [0;2;1];
p2 = [3;3;3];
p3 = [1;0;2];
p4 = [0;-1;0];
p = [p0,p1,p2,p3,p4];

% % uniform para method
lagrangeInterp(p, x, 'uniform');
% % chord para method
lagrangeInterp(p, x, 'chord');
% chebyChord para method
lagrangeInterp(p, x, 'chebyChord');

