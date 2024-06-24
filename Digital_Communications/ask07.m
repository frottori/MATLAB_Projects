% Σήμα πληροφορίας με πλάτος 1 Volt

Am=1;                 % πλάτος σήματος
fm=2;                   % Συχνότητα σήματος
t=0:0.001:1;            % Xρονική περιοδος σήματος
sm=Am*sin(2*pi*fm*t);   % Σχέση σήματος

% Γραφική παράσταση σήματος πληροφορίας
subplot(3,1,1); 
plot(t,sm);             
title('Σήμα πληροφορίας');
xlabel('Χρόνος (t)');
ylabel('Πλάτος');

% Σήμα φέροντος
Ac = 1;                 % Πλάτος φέροντος
fc = 100;               % Συχνότητα φέροντος

sc = Ac*cos(2*pi*fc*t); % Σήμα φέροντος

% Γραφική παράσταση σήματος φέροντος
subplot(3,1,2);
plot(t,sc);
title('Σήμα φέροντος');
xlabel('Χρόνος (t)');
ylabel('Πλάτος');

% Αναλογική διαμόρφωση ΑΜ
s=(1+sm).*sc;
subplot(3,1,3);
plot(t,s,'b');              
title ('Διαμορφωμένο σήμα ΑΜ');
xlabel ('Χρόνος (t)');
ylabel('Πλάτος');

% Υπολογισμός περιβάλλουσας του διαμορφωμένου σήματος
env = abs(sm + 1); 
hold on;
plot(t,env,'r');    % η πάνω περιβάλλουσα (envelope) του διαμορφωμένου σήματος
hold on;
plot(t,-env,'r');    % η κάτω περιβάλλουσα (envelope) του διαμορφωμένου σήματος
grid on;

% Σήμα πληροφορίας με πλάτος 2 Volt
figure;
Am=2;                   % πλάτος σήματος
fm=2;                   % Συχνότητα σήματος
t=0:0.001:1;            % Xρονική περιοδος σήματος
sm=Am*sin(2*pi*fm*t);   % Σχέση σήματος

% Γραφική παράσταση σήματος πληροφορίας
subplot(3,1,1); 
plot(t,sm);             
title('Σήμα πληροφορίας');
xlabel('Χρόνος (t)');
ylabel('Πλάτος');

% Σήμα φέροντος
Ac = 1;                 % Πλάτος φέροντος
fc = 100;               % Συχνότητα φέροντος

sc = Ac*cos(2*pi*fc*t); % Σήμα φέροντος

% Γραφική παράσταση σήματος φέροντος
subplot(3,1,2);
plot(t,sc);
title('Σήμα φέροντος');
xlabel('Χρόνος (t)');
ylabel('Πλάτος');

% Αναλογική διαμόρφωση ΑΜ
s=(1+sm).*sc;
subplot(3,1,3);
plot(t,s,'b');              
title ('Διαμορφωμένο σήμα ΑΜ');
xlabel ('Χρόνος (t)');
ylabel('Πλάτος');

% Υπολογισμός περιβάλλουσας του διαμορφωμένου σήματος
env = abs(sm + 1); 
hold on;
plot(t,env,'r');    % η πάνω περιβάλλουσα (envelope) του διαμορφωμένου σήματος
hold on;
plot(t,-env,'r');   % η κάτω περιβάλλουσα (envelope) του διαμορφωμένου σήματος
grid on;

%! Σχολιάστε τα γραφήματα, σε ποια περίπτωση αντιστοιχούν?