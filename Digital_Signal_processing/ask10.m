% a)
n=-20:20;
% είσοδος συστήματος
x = 2*gauspuls(n+1) + 4*gauspuls(n) + 8*gauspuls(n-1) + 9*gauspuls(n-2);

% συντελεστές y
a = [1 -0.4];  
% συντελεστές x
b = [1 0 -0.7];
y = filter(b,a,x);
stem(n,y)
legend('y[n]')

% b)
h = impz(b,a,n);
figure;
stem(n,h);
legend('h κρουστική')
