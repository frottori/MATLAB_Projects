n =-2:10;
x = [1:7, 6:-1:1];

subplot(321)
stem(n,x);
title('(a)')
axis([-11 21 -1 8])

subplot(322)
stem(n+5,x)
title('(b)')
axis([-11 21 -1 8])

subplot(323)
stem(n-4,x)
title('(c)')
axis([-11 21 -1 8])

subplot(324)
stem(-n,x)
title('(d)')
axis([-11 21 -1 8])

subplot(325)
stem(2*n,x)
title('(e)')
axis([-11 21 -1 8])

subplot(326)
stem(n/2,x)
title('(f)')
axis([-11 21 -1 8])