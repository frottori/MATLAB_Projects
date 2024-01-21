n = 0:15;
xn = n;
syms w
Xw=sum(xn.*exp(-1j*w*n));
w1=0:0.1:2*pi;
Xw1=subs(Xw,w,w1);

figure;
subplot(211)
plot(w1,abs(Xw1))