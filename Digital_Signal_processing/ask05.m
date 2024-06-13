n=-12:12;

% κρουστική απόκριση
h1 = gauspuls(n + 4);
h2 = (n + 1) >= 0;
h3 = (n - 2) >= 0;
h = sqrt(8 * abs(n)).*(2*h1 + h2 - 3.*h3);
subplot(211)
stem(n,h)
axis([ -13 13 -21 13])
legend('h(n)')

% είσοδος συστήματος
x = 4*gauspuls(n+3) + 2*gauspuls(n) - gauspuls(n-1) + 5*gauspuls(n-3);
subplot(212)
stem(n,x)
axis([ -13 13 -1.5 5.5])
legend('x(n)')

% έξοδος συστήματος
b = length(n) - 1; % για το μήκος του διανύσματος y
y = conv(x,h);
figure;
stem(-b:b,y)
axis([ -25 25 -170 50])
legend('y(n)')
