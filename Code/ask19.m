% Συντελεστές αριθμητή και παρανομαστή S1 συστήματος για ΣΜ
den1 = [2 1 0.5 0];
num1 = [0 0.1 0 0.1];

% Συντελεστές αριθμητή και παρανομαστή S2 συστήματος για ΣΜ
den2 = [1 0 0 0];
num2 = [2 0 1 0];

% Συντελεστές αριθμητή και παρανομαστή S3 συστήματος για ΣΜ
den3 = [1 0 -0.5 0.8];
num3 = [1 0.4 -1.4 0];

% κρουστική απόκριση h3
h3 = impz(num3,den3);

% Επειδή το τα S1 και S2 είναι ΓΧΑ ισχυέι η αρχή της υπέρθεσης
% άρα το άθροισμα τους μας δίνει ένα σύστημα το S12 που απλώς αθρόιζω τους
% συντελεστές του S1 και S2 (παράλληλη σύνδεση)
den12 = den1 + den2;
num12 = num1 + num2;

% κρουστική απόκριση h12
h12 = impz(num12,den12);

% h = h12 * h3 (σε σειρά σύνδεση)
h = conv(h12,h3);
% σχεδιασμός h
stem(h);