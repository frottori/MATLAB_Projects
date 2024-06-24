% Δημιουργία ψευδοτυχαίων ακεραίων
data = randi([0, 15], 1, 10000);

% Διαμόρφωση 16QAM
M = 16; 
modData = qammod(data, M);

% Διάγραμμα αστερισμού της αθόρυβης ακολουθίας
scatterplot(modData);
title('Διάγραμμα αστερισμού της αθόρυβης ακολουθίας 16QAM');

% Προσθήκη θορύβου AWGN με SNR = 12dB
SNR = 12; 
rxSignal = awgn(modData, SNR, 'measured');

% Διάγραμμα αστερισμού της ενθόρυβης ακολουθίας
scatterplot(rxSignal);
title('Διάγραμμα αστερισμού της ενθόρυβης ακολουθίας 16QAM');

% Αποδιαμόρφωση της ενθόρυβης ακολουθίας
demodData = qamdemod(rxSignal, M);

% Υπολογισμός του Bit Error Rate (BER)
% Μετατροπή των δεδομένων σε δυαδική μορφή
dataBits = de2bi(data, log2(M));
demodBits = de2bi(demodData, log2(M));

% Υπολογισμός BER
[numErrors, ber] = biterr(dataBits, demodBits);
%! Πόσα λάθη γίνονται;
disp(['Αριθμός λαθών:',num2str(numErrors)]);
disp(['Bit Error Rate:',num2str(ber)]);