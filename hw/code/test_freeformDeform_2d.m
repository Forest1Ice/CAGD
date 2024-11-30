% test function 'freeFormDeform_2d'

% degree
m = 2;
n = 2;

% u,v paras
t = 0:0.05:2*pi;
u = 1 / 2 * cos(t) + 1 / 2;
v = 1 / 2 * sin(t) + 1 / 2;

% initial
freeFormDeform_2d(m, n, u, v);

% modify control points
p = cell(n + 1, m + 1);

for i = 1:n + 1
    for j = 1:m + 1
        p{i, j} = [(j - 1) / n ; (i - 1) / m];
    end
end
p{1, 2} = [2/3; 1/4];
p{n + 1, m + 1} = [1.5; 2];
freeFormDeform_2d(m, n, u, v, p);