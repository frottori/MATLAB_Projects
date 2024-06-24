A = 1;      % Πλάτος φέροντος σήματος
fc = 100e3; % Φέρουσα συχνότητα
fs = 1e6;   % Ρυθμός δειγματοληψίας
Tb = 3e-3;  % Bit duration
T = 1/fs;   % Περίοδος

% Σήμα πληροφορίας
m = [1 0 1 0 0 0 1 1 1];
N = length(m);
t = 0:T:N*Tb - T;           % Χρονική διάρκεια για το σήμα

% Σήμα φέροντος
bs = A*cos(2*pi*fc*t);

% Δημιουργία του διαμορφωμένου σήματος BPSK
m_mod = repelem(m, fs*Tb);   % Δειγματοληψία του σήματος πληροφορίας
% Διαμόρφωση BPSK
bpsk_signal = bs .* (2*m_mod - 1);

% Γραφική αναπαράστασεις σήματος πληροφορίας και διαμορφωμένου
t_val = 0:Tb:N;
figure;
subplot(2,1,1);
plot(t, m_mod);
title('Σήμα Πληροφορίας m(t)');
xlabel('Χρόνος(t)');
ylabel('Πλάτος');
xticks(t_val);
grid on;

subplot(2,1,2);
plot(t, bpsk_signal);
title('Διαμορφωμένο Σήμα BPSK');
xlabel('Χρόνος(t)');
ylabel('Πλάτος');

% Υπολογισμός του φάσματος
M = length(m_mod);      % το πλήθος των σημείων του σήματος
BW = 1/T;               % εύρος ζώνης που ορίζεται από τη δειγματοληψία
df = BW/length(m_mod);  % η δειγματοληψία στο πεδίο των συχνοτήτων
f = -BW/2:df:(BW/2-df); % πεδίο συχνότητας

% Φάσμα σήματος πληροφορίας
Mf = fft(m_mod);
M_f = fftshift(Mf)/M;

% Φάσμα διαμορφωμένου σήματος
BPSKf = fft(bpsk_signal);
BPSK_f = fftshift(BPSKf)/M;

% Γραφική αναπαράσταση του φάσματος πλάτους
figure;
subplot(2,1,1);
plot(f, abs(M_f));
title('Φάσμα Πλάτους m(t)');
xlabel('Συχνότητα');
ylabel('Πλάτος');

subplot(2,1,2);
plot(f, abs(BPSK_f));
title('Φάσμα Πλάτους Διαμόρφωσης BPSK');
xlabel('Συχνότητα');
ylabel('Πλάτος');