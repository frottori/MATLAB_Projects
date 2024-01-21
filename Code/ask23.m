n1 = -10:10;
n2 = -40:40;
x1 = 2*cos(3*pi*n1/4);
x2 = 2*cos(3*pi*n2/4);

% Υπολογισμός FFT για τα σήματα x1 και x2
N = 512;
X1 = fft(x1, N);
X2 = fft(x2, N);

k = 0:N-1;
w = 2*pi*k/N;

figure;
plot(w,abs(X1),'DisplayName','-10<=n<=10');

hold on;
plot(w, abs(X2),'DisplayName','-40<=n<=40');
title('Φάσμα Πλάτους')
legend('show');

% ΣΧΟΛΙΑΣΜΟΣ