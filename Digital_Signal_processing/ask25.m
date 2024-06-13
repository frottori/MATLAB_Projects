n=0:6;
u1 = n >= 0; % μοναδιαία βηματική u(n)
u2 = (n - 4) >= 0; % μοναδιαία βηματική u(n - 7)
u3 = (n - 7) >= 0; % μοναδιαία βηματική u(n - 7)

x = (n+1).*(u1 - u2);
y = u1 - u3;

% Υπολογισμός συνέλιξης με linconv()
CONV=linconv(x,y);
disp("linconv()");
disp(CONV);

% Σχεδιασμός συνέλιξης από linconv()
stem(CONV);

% Υπολογισμός συνέλιξης με conv()
CONV=conv(x,y);
disp("conv()");
disp(CONV);

% Σχεδιασμός συνέλιξης από conv()
hold on;
stem(CONV,'r');
title('Συνέλιξη');