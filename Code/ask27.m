% Ορισμός σημάτων
n=0:3;
x = gauspuls(n)-2*gauspuls(n-2)+4*gauspuls(n-5);
w = [1 1 2 -1];

% α) Κυκλική συνέλιξη 8 σημείων

y = ifft(fft(x,8).*fft(w,8));
disp("Κυκλική συνέλιξη 8 σημείων:");
disp(y);

% β) Γραμμική συνέλιξη
%   α) στο πεδίο του χρόνου
y = conv(x,w);
disp("Γραμμική συνέλιξη:");
disp(y);
stem(y,'DisplayName','conv()');

%   β) fft(),ifft()
% συνάρτηση linconv() του ερωτήματος 24α
y = linconv(x,w);
disp("Γραμμική συνέλιξη με fft(),iff()");
disp(y);

hold on;
stem(y,'r','DisplayName','linconv()');
legend('show');