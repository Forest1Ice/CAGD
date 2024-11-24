% test function 'deCasteljau2'

% control polygon
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

% parameters
u = [0, 1];
v = [0, 1];

% 'deCasteljau2' function
S = deCasteljau2(p, u, v);
S = cell2mat(S(:)');

% check whether S(0, 0) == p11, S(1, 0) == p31, S(0, 1) == p14 and 
% S(1, 1) == p34
if isequal(S(:, 1), p{1, 1}) && isequal(S(:, 2), p{3, 1})...
    && isequal(S(:, 3), p{1, 4}) && isequal(S(:, 4), p{3, 4})
    disp('Success! deCasteljau algorithm is correct!');
else
    disp('Failure! deCasteljau algorithm is wrong!');
end