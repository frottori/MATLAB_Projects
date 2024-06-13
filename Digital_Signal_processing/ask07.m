n =-50:50;
% Υπολογισμός και γράφημα x
x = 4*gauspuls(n+1) + 9*gauspuls(n) - 2*gauspuls(n - 2);
subplot(211)
stem(n,x)
legend('x')

% Υπολογισμός και γράφημα y
y1 = (n + 2) >= 0;
y2 = (n - 3) >= 0;
y = (n/6).*(y1 - y2);
subplot(212)
stem(n,y)
legend('y')

b = length(n) - 1; % για το μήκος του διανύσματος z
% Υπολογισμός συνέλιξης z1 με την contoe (ασκ. 6) και γράφημα
z1 = convtoe(x,y);
figure
stem(-b:b,z1,'b')
legend('z')
hold on;

% Υπολογισμός συνέλιξης z1 με την conv και γράφημα (στο ίδιο παράθυρο για 
% δω ότι είναι ίσα)
z2 = conv(x,y);
stem(-b:b,z2,'g')
legend('z')