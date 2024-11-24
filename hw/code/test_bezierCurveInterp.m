% test function 'bezierCurveInterp'

% two dimension
p0 = [-1;0];
p1 = [0;1];
p2 = [3;3];
p3 = [1;0];
p4 = [0;-1];
p = [p0,p1,p2,p3,p4];

% % uniform para method
bezierCurveInterp(p, true, 'uniform');
% % chord para method
bezierCurveInterp(p, true, 'chord');
% chebyChord para method
bezierCurveInterp(p, true, 'chebyChord');

% three dimension
p0 = [-1;0;0];
p1 = [0;2;1];
p2 = [3;3;3];
p3 = [1;0;2];
p4 = [0;-1;0];
p = [p0,p1,p2,p3,p4];

% % uniform para method
bezierCurveInterp(p, true, 'uniform');
% % chord para method
bezierCurveInterp(p, true, 'chord');
% chebyChord para method
bezierCurveInterp(p, true, 'chebyChord');

