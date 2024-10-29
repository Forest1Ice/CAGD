% test function 'dividedDiff'

p = [0, 1, 2, 3; 6, -3, -6, 9];

% compute divided differences
t = dividedDiff(p);

% check whether the result is correct
if isequal(t, [6, -9, 3, 2])
    disp('Success! divided difference algorithm is correct!');
else
    disp('Failure! divided difference algorithm is wrong!');
end