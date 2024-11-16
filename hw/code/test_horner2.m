% test function 'horner2'

% parameters
u = 0:0.01:1;
v = 0:0.01:1;

% coefficient matrix
a = cell(3, 4);
a{1, 1} = [2; 0; 1];
a{1, 2} = [1; 0; 2];
a{1, 3} = [0; 0; 1];
a{1, 4} = [-1; 0; 2];
a{2, 1} = [2; 1; 1];
a{2, 2} = [1; 1; 2];
a{2, 3} = [0; 1; 1];
a{2, 4} = [-1; 1; 2];
a{3, 1} = [2; 2; 1];
a{3, 2} = [1; 2; 2];
a{3, 3} = [0; 2; 1];
a{3, 4} = [-1; 2; 2];

figure('Name', 'Power Basis Surface');
S = horner2(a, u, v, true);