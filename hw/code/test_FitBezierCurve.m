% test function 'fitBezierCurve'

% degree
n = 3;

% two dimension
p0 = [-1;0];
p1 = [0;1];
p2 = [3;3];
p3 = [1;0];
p4 = [0;-1];
p = [p0,p1,p2,p3,p4];

% % uniform para method
fitBezierCurve(p, n, 'uniform');
% % chord para method
fitBezierCurve(p, n, 'chord');
% chebyChord para method
fitBezierCurve(p, n, 'chebyChord');

% three dimension
p0 = [-1;0;0];
p1 = [0;2;1];
p2 = [3;3;3];
p3 = [1;0;2];
p4 = [0;-1;0];
p = [p0,p1,p2,p3,p4];
t = chordPara(p);

% % uniform para method
fitBezierCurve(p, n, 'uniform');
% % chord para method
fitBezierCurve(p, n, 'chord');
% chebyChord para method
fitBezierCurve(p, n, 'chebyChord');

