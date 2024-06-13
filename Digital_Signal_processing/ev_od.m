function [xe,xo,m] = ev_od(x,n)

m = length(n);
xr=x(m:-1:1); % reversed (x[-n])
% even part xe(n)=1/2[x(n)+x(-n)]
xe=1/2*(x+xr);
% odd part xo(n)=1/2[x(n)-x(-n)] 
xo=1/2*(x-xr);

% graph of signal x, xe ,xo
subplot(311);
stem(n,x); 
title('original'); 
axis([min(n)-1 max(n)+1 min(x)-1 max(x)+1]);
grid on;

subplot(312);
stem(n,xe); 
title('even part'); 
axis([min(n)-1 max(n)+1 min(xe)-1 max(xe)+1]);
grid on;

subplot(313);
stem(n,xo); 
title('odd part'); 
axis([min(n)-1 max(n)+1 min(xo)-1 max(xo)+1]);
grid on;

end