N = 10000;
n = -N:N;
% μοναδιαίας βηματική ακολουθία
u = (n >=0);
% Υπολογισμός της ισχύος σύμφωνα με τον τύπο
p = sum(abs(u).^2) / (2*N+1);

disp(['P = ' num2str(p)]);

% Το αποτέλεσμα είναι πολύ κοντά (μάλλον λόγω πράξεων με floats) 
% με την θεωρητική επίλυση 