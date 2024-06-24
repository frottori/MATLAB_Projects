% Μέση τιμή
mean1 = 0.5;
% Τυπική απόκλιση
sig1 = 3;
% Λευκός Gaussian θόρυβος
noise1 = sig1*randn(1,300000) + mean1;

subplot(2,1,1);
plot(noise1,'b');
title("Λευκός Gaussian θόρυβος με μ = 0.5, σ = 3");
xlabel('Δείγματα');
ylabel('Θόρυβος');
legend('noise1');
grid on;

% Μέση τιμή
mean2 = -3.5;
% Τυπική απόκλιση
sig2 = 2;
% Λευκός Gaussian θόρυβος
noise2 = sig2*randn(1,300000) + mean2;

subplot(2,1,2);
plot(noise2,'r');
title("Λευκός Gaussian θόρυβος μ = -3.5, σ = 2");
xlabel('Δείγματα');
ylabel('Θόρυβος');
legend('noise2')
grid on;

% Δημιουργία και σχεδίαση των ιστογράμματων των δύο θορύβων
figure;
bins = 20;
histogram(noise1, bins, 'FaceColor', 'blue');
hold on;
histogram(noise2, bins, 'FaceColor', 'red');
xlabel('Συχνότητες bin');
ylabel('Δείγματα');
legend('noise1','noise2')
grid on;