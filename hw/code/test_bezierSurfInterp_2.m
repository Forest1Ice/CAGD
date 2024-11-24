% test function 'bezierSurfInterp'

q = cell(5, 5);
for i = 1:5
    for j = 1:5
        q{i, j} = [-3 + i; -3 + j; 0];
    end
end
q{3, 3} = [0; 0; 1];

% 'chord' para
bezierSurfInterp(q, true, "chord");

% 'chebyChord' para
bezierSurfInterp(q, true, "chebyChord");