% test function 'allBernstein'
n = 3;
u = 0.5;

% 'allBernstein' function
B = allBernstein(n,u);

% test whether all values sum up to 1
if (sum(B) == 1)
    disp('Success! Bernstein function is correct!');
else
    disp('Failure! Bernstein function is wrong!');
end