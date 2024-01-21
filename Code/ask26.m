% Ορισμός σημάτων
n=0:3;
x = gauspuls(n)-2*gauspuls(n-2)+4*gauspuls(n-5);
w = [1 1 2 -1];

% Κυκλική συνέλιξη
% α) στο πεδίο του χρόνου

N=length(n);
p = zeros(1, N-1); % αρχικοποιήση p διανύσματος
for m = 0:(N-1)
    p(m+1)=mod(-m,N);
end

% Κυκλικά ανακλάσμενο σήμα ws του w
ws = zeros(1, N-1); % αρχικοποιήση ws διανύσματος
for m = 0:(N-1)
    ws(1+m)=w(1+p(m+1));
end

y = zeros(1, N-1); % αρχικοποιήση y διανύσματος
% Υπολογισμός κυκλικής συνέλιξης για κάθε n
for i = 0:N-1
    wsn = circshift(ws', i);
    y(i+1) = x*wsn;
end
disp("Κυκλική συνέλιξη στο πεδίο του χρόνου:");
disp(y);

% β) με χρήση fft(),ifft()
y_fft = ifft(fft(x).*fft(w));
disp("Κυκλική συνέλιξη με fft() και ifft():");
disp(y_fft);

% Γράφημα
stem(n,y,'b','DisplayName','α)');
hold on;
stem(n,y,'r','DisplayName','β)');
title('Κυκλική συνέλιξη')
legend('show');
% Βλέπουμε ότι ισούνται 