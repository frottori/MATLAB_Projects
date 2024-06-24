% Δυαδική ακολουθία
x = [1 1 0 1 0 1 0 0 1 0];

% Παράμετροι
T = 6;              % Διάρκεια παλμού 
Fs = 1000;          % Ρυθμός δειγματοληψίας
dt = 1/Fs;          % Χρονικό βήμα
t = 0:dt:T-dt;      % Χρονικό διάνυσμα για έναν παλμό
f = 1/T;            % Συχνότητα

% Αρχικοποίηση διανυσμάτων για τα σήματα
unrz = zeros(1,27);
bnrz = zeros(1,27);
amirz = zeros(1,27);
manch = [];
prev = -1;
N = length(t);

% Δημιουργία των σημάτων
for i = 1:length(x)
    t1 = (i-1)*N;
    t2 = i*N;
    if x(i) == 1
        unrz(t1 + 1:t2) = square(2*pi*f*t, 100);
        bnrz(t1 + 1:t2) = square(2*pi*f*t, 100);
        prev = -prev;
        amirz(t1 + 1:t2) = prev * square(2*pi*f*t, 100);
        manch = [manch, square(2*pi*f*t, 50)];
    else
        unrz(t1 + 1:t2) = 0;
        bnrz(t1 + 1:t2) = -square(2*pi*f*t, 100);
        amirz(t1 + 1:t2) = 0;
        manch = [manch, -square(2*pi*f*t, 50)];
    end
end

% Συνολική χρονική διάρκεια
tt = 0:dt:(length(x)*T)-dt;

% Καθορισμός των σημείων στον άξονα για το γράφημα ανα 6 όσο η διάρκεια του παλμού
t_val = 0:T:N;

subplot(4, 1, 1);
plot(tt, unrz);
title('Μονοπολική NRZ');
xlabel('Χρόνος(t)');
ylabel('Volt');
xticks(t_val);
grid on;

subplot(4, 1, 2);
plot(tt, bnrz);
title('Διπολική NRZ');
xlabel('Χρόνος(t)');
ylabel('Volt');
xticks(t_val);
grid on;

subplot(4, 1, 3);
plot(tt, amirz);
title('AMI RZ');
xlabel('Χρόνος(t)');
ylabel('Volt');
xticks(t_val);
grid on;

subplot(4, 1, 4);
plot(tt, manch);
title('Manchester');
xlabel('Χρόνος(t)');
ylabel('Volt');
xticks(t_val);
grid on;