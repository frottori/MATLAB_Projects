syms n z
n_v = 0:7;
% X(z)

Xz=z/(z-1/3);
x=iztrans(Xz,n);
disp('Aκολουθία x[n]:');
pretty(x);

% Υπολογισμός της ακολουθίας x[n] για n = 0 έως 7
x_n = subs(x, n, n_v);

disp('Οι πρώτοι 8 όροι της x[n]:');
pretty(x_n);

% Y(z)

Yz=(z^2 + 1.6*z)/((z + 1.8)*(0.5*z - 0.8));
y=iztrans(Yz);

disp('Aκολουθία y[n]:');
pretty(y);

% Υπολογισμός της ακολουθίας x[n] για n = 0 έως 7
y_n = subs(y, n, n_v);

disp('Οι πρώτοι 8 όροι της y[n]:');
disp(y_n);
