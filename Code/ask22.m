% Αντίστροφος DFT
xn1 = ifft(X_fft1);
xn2 = ifft(X_fft2);

figure;
subplot(311)
stem(n,xn);
title('Αρχικό σήμα x[n]');

subplot(312)
stem(n,xn1);
title('Σήμα από DFT (N=16)');

subplot(313)
stem(0:31,xn2);
title('Σήμα από DFT DFT (N=32)');