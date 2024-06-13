function y=linconv(x1,x2)
N1=length(x1);
N2=length(x2);
M=N1+N2-1;

% Υπολογισμός DFT των δύο ακολουθιών
X1=fft(x1,M);
X2=fft(x2,M);
PROD=X1.*X2; % γινόμενο των δύο DFT
y=ifft(PROD); % O IDFT ισούται με την γραμμική συνέλιξη των σημάτων
end