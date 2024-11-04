% test function 'lagrangeInterp'

x = 0:0.01:1;

p0 = [-1;-1];
p1 = [0;0];
p2 = [1;1];
p3 = [3;3];
p4 = [4;4];
p = [p0,p1,p2,p3,p4];

y = lagrangeInterp(p, x, 'chord');