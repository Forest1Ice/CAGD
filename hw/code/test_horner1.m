% test function 'horner1'

% parameters
t = 0:0.01:1;

%1d
a = [1, 2, -4, 5];

fig1 = figure('Name', 'One Dimension Power Basis Curve');
horner1(a, t, true);

% 2d
a = [1, 2, 4, 5; 2, -4, -5, 7];

fig2 = figure('Name', 'Two Dimension Power Basis Curve');
horner1(a, t, true);

% 3d
a = [1, 2, -4, 5; 2, 4, 5, 7; 3, 5, 8, -9];

fig3 = figure('Name', 'Three Dimension Power Basis Curve');
horner1(a, t, true);