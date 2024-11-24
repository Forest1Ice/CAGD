% test function 'bezierSurfInterp'

q = cell(4, 4);
q{1, 1} = [0; 0; 4];
q{1, 2} = [1; 0; 3];
q{1, 3} = [2; 0; 1.5];
q{1, 4} = [3; 0; 1];
q{2, 1} = [0; 1; 3.5];
q{2, 2} = [1; 1; 3];
q{2, 3} = [2.2; 1; 1];
q{2, 4} = [3; 1.2; 1];
q{3, 1} = [0; 1.5; 2];
q{3, 2} = [1; 1.5; 1.5];
q{3, 3} = [2.2; 1; 0];
q{3, 4} = [3; 1.5; 0];
q{4, 1} = [0; 2.5; 2];
q{4, 2} = [1.2; 2.2; 1.5];
q{4, 3} = [2; 2.5; 0];
q{4, 4} = [3; 3; 0];

% 'chord' para
bezierSurfInterp(q, true, "chord");

% 'chebyChord' para
bezierSurfInterp(q, true, "chebyChord");