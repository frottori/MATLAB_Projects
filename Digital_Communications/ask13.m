f1 = 100; f2 = 50;
f = lcm(f1, f2);
A1 = 2; A2 = 5;
T = 1/f; dt = T/100;
t = 0:dt:0.02;

% Υπολογισμός του σήματος x
x = A1*sin(2*pi*f1*t) + A2*cos(2*pi*f2*t);

% Δειγματοληψία σήματος x με 1.2Khz
fs = 1200;
Ts = 1/fs;
t1 = 0:Ts:0.02;
xs = A1*sin(2*pi*f1*t1) + A2*cos(2*pi*f2*t1);

Nq = 4; % πλήθος επιπέδων κβάντισης
FSR = A1 + A2;
sampled = xs;
% βήμα κβάντισης = Full Scale Range/πλήθος επιπεδων κβάντισης
step = FSR/(Nq/2);      
partition = (-FSR+step):step:(FSR-step);        
codebook = (-FSR+(step/2)):step:(FSR-(step/2));  
[index, quants, distor] = quantiz(sampled, partition, codebook);

% Γραφική παράσταση αρχικού σήματος
plot(t,x,'b')
hold on;
% Γραφική παράσταση δειγματοληπτημένου σήματος
stem(t1,quants,'r');

% Γραφική παράσταση του σφάλματος κβάντισης
qerr = sampled-quants;
hold on;
plot(t1, qerr, 'g');

% Γραφική παράσταση των ορίων ζώνων κβάντισης (κάθε γραμμή)
for i = 1:length(partition)
    yline(partition(i), 'k');
end

% Γραφική παράσταση των επιπέδων κβάντισης (κάθε γραμμή)
for i = 1:length(codebook)
    yline(codebook(i), 'm--');
end

title('Κβαντιση σε 4 επίπεδα')
legend('Αρχικό Σήμα', 'Κβαντισμένο Σήμα','Σφάλμα Κβάντισης');

% Δημιουργία δυαδικών ακολουθίων
% Η dec2bin μετατρέπει ένα πίνακα με δεκαδικούς αριθμούς σε έναν πίνακα με δυαδικούς αριθμούς αντίστοιχα
% Άρα μετατρέπονται οι αριθμοί μέχρι το πλήθος των πλήθων κβάντισεις (Nq = 4) - 1 γιατί οι δυαδικοι αριθμοί 2 bit
% είναι 2^2-1 = 3. (0 = 00, 1 = 01, 2 = 10, 3 = 11)
code_words = dec2bin(0:Nq-1); 

% Αντιστοιχίζει τις κωδικές λέξεις στις κβαντισμένες τιμές 
% χρησιμοποιώντας τον πίνακα code_words και τον πίνακα δεικτών index απο την quantiz
labels = code_words(index+1, :);

% Αντιστοίχιση των κωδικών λέξεων σε κάθε κβαντισμένενη τιμή τους σήματος 
for i = 1:length(t1)
    % το t1(i) είναι η συντεγμένη x και το quants(i) είναι η συντεταγένη y των κβαντισμένων τιμών
    % labels(i,:) βάζει την τρέχουσα κωδικολέξη για το σημείο
    text(t1(i), quants(i), labels(i,:), 'VerticalAlignment','bottom','HorizontalAlignment','right');
end