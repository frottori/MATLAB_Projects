n = -5:10;
x1 = zeros(size(n)); 
x1(n == 0) = 2;
x1(n == 2 | n == 3) = 3;
x1(n == 4) = 4;
c1 = (n) >= 0;
c2 = (n - 6) >=0;
x2 = c1 - c2;
subplot(221)
stem(n,x1);
legend('x1');
subplot(222)
stem(n,x2);
legend('x2');

a=4;
b=6;

% Αριστερό μέρος σχέσης
z = a*x1 + b*x2;
y1 = (4 * n.^2).*z;

subplot(223)
stem(n,y1);
legend('y1');

% Δεξί μέρος σχέσης (ισούνται άρα γραμμικό)
z1=(4 * n.^2).*x1; 
z2=(4 * n.^2).*x2;
y2=a*z1+b*z2; 

subplot(224)
stem(n,y2);
legend('y2');
