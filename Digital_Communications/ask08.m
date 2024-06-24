% Path στο αρχείο ήχου
audiofile = 'data/3WORDS.wav';

% Διαβάζω διάνυσμα και συχνότητα δειγματοληψίας
[x1, fs] = audioread(audiofile);

% Παίξιμο του ήχου
sound(x1, fs);

% Διάρκεια του δείγματος
T0 = 1/fs;          % Περίοδος δειγματοληψίας
N1 = length(x1);
t1 = (0:N1-1) * T0;   % Χρονική κλίμακα για όλα τα δείγματα

% Γραφική παράσταση της κυματομορφής
subplot(2,1,1);
plot(t1, x1);
title('Γραφική Παράσταση ήχου');
xlabel('Χρόνος (seconds)');
ylabel('x(t)');
grid on;

% Υπολογισμός του φάσματος
BW = 1/T0;              % εύρος ζώνης που ορίζεται από τη δειγματοληψία στο χρόνο
df = BW/N1;              % η δειγματοληψία στο πεδίο των συχνοτήτων
f = -BW/2:df:(BW/2-df); % πεδίο συχνότητας

X1f = fft(x1);
X1f = fftshift(X1f)/N1;

subplot(2,1,2);
plot(f, abs(X1f));
title('Φάσμα Πλάτους');
xlabel('Συχνότητα (Hz)');
ylabel('|X1(f)|');

% Διαβάζω το διάνυσμα τώρα με μόνο τα πρώτα 50000 δείγματα 
[x2, fs] = audioread(audiofile, [1 50000]);

% Παίξιμο του ήχου 
sound(x2, fs);

%! Τι παρατηρείτε?
% Ότι ο ήχος έχει μικρότερη διάρκεια, και ακούγεται μόνο η πρώτη λέξη (αφού τώρα είναι λιγότερα τα δείγματα)

% Φέρον σήμα 
Ac = 1;       % Πλάτος φέροντος
fc = 1e5;     % Συχνότητα φέροντος
T0 = 1/fs;    % Περίοδος δειγματοληψίας
N2 = length(x2);
t2 = (0:N2-1) * T0;   % Χρονική κλίμακα για όλα τα δείγματα
xc = Ac*cos(2*pi*fc*t2).'; % Σήμα φέροντος (μετατροπή σε διάνυσμα στήλης για να πολλαπλασιαστεί με το x2)

% Υπολογισμός διαμόρφωσης σήματος DSB
x=xc.*x2;
figure;
plot(t2,x,'b'); 

% Αποδιαμόρφωση σήματος (με τη χρήση σύμφωνης φώρασης)
lo=cos(2*pi*fc*t2).';  % ο τοπικός ταλαντωτής (local oscillator) με συχνότητα ίδια με του φέρον σήματος

% Αποδιαμόρφωση του x
x2_out=x.*lo;       % αποδιαμορφωμένο σήμα x

order = 10;         % Τάξη φίλτρου
fcut = fs/10;       % Συχνότητα αποκοπής χαμηλοπερατού φίλτρου 
fcenter = 0;        % Κέντρο φίλτρου

% Φιλτράρισμα του σήματος x2
% Με τη χρήση χαμηλοπερατού φίλτρου κρατάμε μόνο το σήμα βασικής ζώνης
dt = T0;
demod=butterworth_filter(x2_out, dt, order, fcut, fcenter);

% Γραφική παράσταση αποδιαμορφωμένου σήματος
hold on;
plot(t2,real(demod),'r');
title('Διαμόρφωση και Αποδιαμόρφωση');
xlabel('Χρόνος(t)');
ylabel ('Πλάτος');
legend('DSB Διαμορφωμένο','Αποδιαμορφωμένο σήμα')
grid on;

% Παίξιμο του αποδιαμορφωμένου σήματος
sound(real(demod), fs);

%! Ακούγεται ευκρινώς η λέξη?
% Ναι, ακούγεται ευκρινώς η λέξη γιατί έχουμε και μεγάλη τάξη φίλτρου. 
% Άμα την μειώσουμε ακούγεται ή λέξη αλλά όχι τόσο καθαρά (με θόρυβο).