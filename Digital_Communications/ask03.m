f0 = 80;
T0 = 1/f0;
dt = T0/100;
t = 0:dt:0.8;

x = 3*cos(4*pi*t) + 2*cos(8*pi*t) + sin(12*pi*t);

% Γραφική παράσταση του σήματος x(t)
subplot(3,1,1)
plot(t, x);
title('Γραφική Παράσταση x(t)')
xlabel('Χρόνος (t)');
ylabel('x(t)');
grid on;

% Υπολογισμός του φάσματος
BW = 1/dt;              % εύρος ζώνης που ορίζεται από τη δειγματοληψία στο χρόνο
N = length(x);          % το πλήθος των σημείων του σήματος
df = BW/N;              % η δειγματοληψία στο πεδίο των συχνοτήτων
f = -BW/2:df:(BW/2-df); % οι συχνότητες

Xf = fft(x);
Xf = fftshift(Xf)/N;

% Απεικόνιση του φάσματος πλάτους
subplot(3,1,2);
plot(f, abs(Xf));
title('Φάσμα Πλάτους με ');
xlabel('Συχνότητα (Hz)');
ylabel('|X(f)|');
grid on;

Nf = 2^ceil(log2(N));

df = BW/Nf;                 % η δειγματοληψία στο πεδίο των συχνοτήτων
f = -BW/2:df:(BW/2-df);     % οι συχνότητες

Xf1 = fft(x,Nf);
Xf1 = fftshift(Xf1)/Nf;

% Απεικόνιση του φάσματος πλάτους
subplot(3,1,3);
plot(f, abs(Xf1));
title('Φάσμα Πλάτους');
xlabel('Συχνότητα (Hz)');
ylabel('|X(f)|');
grid on;

%! Ποια είναι η ανάλυση συχνοτήτων στην περίπτωση αυτή?
disp(['Ανάλυση συχνοτήτων:', num2str(f0/Nf)]);