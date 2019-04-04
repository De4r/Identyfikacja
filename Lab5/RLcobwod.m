function dX=RLC1(t, X)

R=4.7;
C=270*10^(-9);
L=220*10^(-6);

w=sqrt(1/(L*C));
b=R/(2*L);
wtl=sqrt(w^2-b^2);

A=1;

Ue=A*sin(wtl*t);

A =[ -R/L, -1/L; 1/C, 0];
B = [1/L; 0];

dX = A*X + B*Ue;
