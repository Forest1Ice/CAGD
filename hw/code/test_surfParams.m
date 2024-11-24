% test function 'chordPara'

% data points
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

% 'chord' para
[u, v] = surfParams(p, "chord");
disp(['u: ', num2str(u)])
disp(['v: ', num2str(v)])

% 'chebyChord' para
[u, v] = surfParams(p, "chebyChord");
disp(['u: ', num2str(u)])
disp(['v: ', num2str(v)])