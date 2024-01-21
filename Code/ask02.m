AML = 1;
AM = [2 1 3 9 0 0 2 1];

% (a)
n1 = -20 - mod(AML,2);
n2 = 20 + mod(AML,2);
n = n1:n2; 
y1 = (n - (2 + mod(AML,5))) >= 0; % μοναδιαια βηματική
y2 = gauspuls(n - mod(AML,4));    % μοναδιαία κρουστική
y = 2.*y1 -8.*y2;

subplot(211)
stem(n,y)
title('(a) y[n]')
axis([-22 22 -9 3])

% (b)
n1 = -5:-1;
n2 = 0:2;
n3 = 3:10;
n = [n1 n2 n3];

x1 = 3*n1;
x2 = exp(n2);
x3 = sqrt(4 * sum(AM)) * ones(size(n3));
x = [x1 x2 x3];

subplot(212)
stem(n,x)
title('(b) x[n]')
axis([-6 11 -20 20])