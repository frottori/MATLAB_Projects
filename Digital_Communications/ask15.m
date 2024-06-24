B = 1:300000;
S_N = 200;
C = B .* log2(1 + S_N ./ B);

semilogx(B,C);
xlabel('Εύρος Ζώνης B (Hz)');
ylabel('Χωρητικότητα Καναλιού C (bits/sec)');
title('Χωρητικότητα Καναλιού C σε Συνάρτηση με το Εύρος Ζώνης B');
grid on;

%! Η τιμή στην οποία τείνει η χωρητικότητα είναι η αναμενόμενη με βάση τη Θεωρία?
% Explaination folder