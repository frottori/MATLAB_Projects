syms n z Y;
% Η default τιμή της συνάρτησης Heaviside στην πηγή είναι 1/2.
% Αλλάζουμε αυτήν την τιμη σε 1.
sympref('HeavisideAtOrigin', 1);
X = ztrans(heaviside(n),z);
X1 = z^(-1)*X;
G = Y-X-X1;
Sol=solve(G,Y);
disp("Υ(z):")
pretty(Sol); 

y=iztrans(Sol,n);
disp("Η έξοδος του συστήματος:")
pretty(y);

n=0:300;
yn=subs(y,n);
stem(n,yn)
legend('έξοδος y')

% Υπολογισμός συνάρτησης μεταφοράς
H = Sol/X;
H = simplify(H);

disp('Η συνάρτηση μεταφοράς:');
pretty(H);

% Απο το τύπωμα βλέπω ότι ισχύουν οι ακόλουθοι συντελεστές της συνάρτησης
% μεταφοράς για τον αριθμητή και παρανομαστή αντίστοιχα:
num = [1 1];
den = [1 0];

% Σχεδιασμός απόκρισης συχνότητας για όλον τον μοναδιαίο κύκλο (0,2π)
figure;
freqz(num, den,'whole');