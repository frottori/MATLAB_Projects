s = 0.1;
FS = 100;
T0 = 1/FS;
dt = T0/100;
t = -0.5:dt:0.5;

g = 1/sqrt(2*pi*s) * exp(-t.^2/(2*s^2));
subplot(2,1,1);
plot(t, g);
title('Γραφική Παράσταση g(t)')
xlabel('Χρόνος (t)');
ylabel('g(t)');
grid on;

N = length(g);
m = nextpow2(N);

% Ποιο είναι το m, και γιατί πρέπει να είναι δύναμη του 2?
% To m είναι η επόμενη δύναμη του 2 από το N που λαμβάνει ώς όρισμα.
% Είναι χρήσιμο για τον υπολογισμό του FFT του σήματος, καθώς o αλγόριθμος
% του FFT είναι πιο γρήγορο όταν το μήκος του σήματος είναι δύναμη του 2 σε
% σύγκριση με αυτά που δεν είναι.


BW = 1/dt;                  % εύρος ζώνης που ορίζεται από τη δειγματοληψία στο χρόνο
df = BW/m;                  % η δειγματοληψία στο πεδίο των συχνοτήτων
f = -BW/2:df:(BW/2-df);     % οι συχνότητες

Gf = fft(g,m);
Gf = fftshift(Gf)/m;

subplot(2,1,2);
plot(f, abs(Gf));
title('Φάσμα Πλάτους');
xlabel('Συχνότητα (Hz)');
ylabel('|X(f)|');
grid on;