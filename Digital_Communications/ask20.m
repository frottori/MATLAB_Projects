t = -4:0.1:4;   % χρονική διάρκεια
x = exp(t);     % σήμα πληροφορίας

% A) χωρίς συμπίεση
l = 0:1:64;     % επίπεδα κβάντισης
z = 0:1:63;     % ζώνες κβάντισης

% Ομοιόμορφη κβάντιση ασυμπιεστου σήματος
[index, xq] = quantiz(x, z, l);

subplot(2, 1, 1);
plot(t, x);
title('Ασυμπιεστο Σήμα x(t)');
xlabel('Χρονός(t)');
ylabel('x(t)');

subplot(2, 1, 2);
plot(t, xq);
title('Κβαντισμένο Σήμα');
xlabel('Χρόνος(t)');
ylabel('Κβαντισμένο x(t)');

% B) Συμπίεση κατα μ-law
mu = 255; 
x_comp = compand(x, mu, max(x), 'mu/compressor');

% Ομοιόμορφη κβάντιση συμπιεσμένου σήματος 
[index_comp, xq_comp] = quantiz(x_comp, z, l);

% Αποσυμπίεση κβαντισμένου σήματος
x_decomp = compand(xq_comp, mu, max(x), 'mu/expander');

figure;
subplot(3, 1, 1);
plot(t, x_comp);
title('Συμπιεσμένο σήμα x(t)');
xlabel('Χρονός(t)');
ylabel('x(t)');

subplot(3, 1, 2);
plot(t, x_decomp);
title('Αποσυμπιεσμένο σήμα x(t)');
xlabel('Χρονός(t)');
ylabel('x(t)');

subplot(3, 1, 3);
plot(t, xq);
title('Κβαντισμένο Σήμα');
xlabel('Χρόνος(t)');
ylabel('Κβαντισμένο x(t)');

% η mean βρίσκει τον μέσο όρο για όλα τα στοιχεία του πίνακα, οπότε αθροίζει 
% το όρισμα για όσα στοιχεία και το διαιρέι δια το πλήθος τους.
D1 = mean((x - xq).^2);    
D2 = mean((x - x_decomp).^2);

disp(['Mέσο τετραγωνικό σφάλμα κβάντισης D1: ', num2str(D1)]);
disp(['Mέσο τετραγωνικό σφάλμα κβάντισης D2: ', num2str(D2)]);