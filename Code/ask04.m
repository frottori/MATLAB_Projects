AM = [2 1 3 9 0 0 2 1];
n1 = -5:-1;
n2 = 0:2;
n3 = 3:10;
n = [n1 n2 n3];

x1 = 3*n1;
x2 = exp(n2);
x3 = sqrt(4 * sum(AM)) * ones(size(n3));
x = [x1 x2 x3];

[xe,xo,m] = ev_od(x,n);