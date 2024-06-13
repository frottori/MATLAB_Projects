% διακριτό σήμα x[n]
n = 0:15;
x = n;

% Υπολογισμός DTFT σύμφωνα με την
% μαθηματική έκφραση
syms w
Xw=sum(x.*exp(-1j*w*n));
% πεδίο συχνοτήτων 0<w<2π
w1=0:0.1:2*pi;
% αντικαθιστώ το w(symbolic) με το w1
Xw1=subs(Xw,w,w1);

% Σχεδιασμός Μέτρου DTFT για 0<=w<=2π 
figure;
plot(w1,abs(Xw1),'DisplayName','DTFT Magnitude')
xlabel('Frequency (w)');
ylabel('Magnitude');

% Υπολογισμός DFT για N=32
N = 32;
X_fft2 = fft(x, N);
k2 = 0:N-1;
w2 = 2*pi*k2/N;

% Μέτρο DFT για N=32
hold on;
stem(w2, abs(X_fft2), 'r', 'DisplayName', 'DFT Magnitude for N=32');

% Υπολογισμός DFT για N=16
N = 16;
X_fft1 = fft(x, N);
k1 = 0:N-1;
w1 = 2*pi*k1/N;

% Μέτρο DTF για N=16
hold on;
stem(w1, abs(X_fft1), 'g', 'DisplayName', 'DFT Magnitude for N=16');
axis([-0.2 6.2 0 122]);
legend('show');