syms n z Y
X = ztrans(heaviside(n), z);
Y1 = z^(-1)*Y;
G=(Y-0.5*Y1)-X;
Sol=solve(G,Y);
disp("Υ(z):")
pretty(Sol); 

y=iztrans(Sol,n);
disp("Η έξοδος του συστήματος:")
pretty(y);

% Σχεδίαση εξόδου συστήματος
n=0:15;
yn=subs(y,n);
stem(n,yn)
legend('y')