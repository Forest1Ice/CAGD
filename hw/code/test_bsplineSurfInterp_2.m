% test function 'bsplineSurfInterp'

% sample data
q = cell(5, 5);
for i = 1:5
    for j = 1:5
        q{i, j} = [-3 + i; -3 + j; 0];
    end
end
q{3, 3} = [0; 0; 1];

% degree in u,v direction
du = 3;
dv = 3;

% 'chord' para
bsplineSurfInterp(q, [du, dv], true, "chord");

% 'chebyChord' para
bsplineSurfInterp(q, [du, dv], true, "chebyChord");
