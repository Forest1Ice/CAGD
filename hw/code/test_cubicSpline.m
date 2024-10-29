% test function 'cubicSpline'
q = [1, 2, 3, 4, 6; log(1), log(2), log(3), log(4), log(6)];
x = 1:0.05:6;

% "first"
cubicSpline(q, x, ["first", 1, 1/6], true);

% "natural"
cubicSpline(q, x, "natural", true);

% "second"
cubicSpline(q, x, ["second", -1, -1/36], true);