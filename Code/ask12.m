n= -10:10;
% συντελεστές y
a = 1;
% συντελεστές x
b = [3 0 0 0 -1];
u = ones(size(n));
y = filter(b,a,u);
stem(n,y)