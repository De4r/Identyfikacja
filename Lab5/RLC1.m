function dX=RLC1(t, X)
% skrypt funkcji 
% paramtery systemu
R=4.7;
C=470*10^(-9);
L=220*10^(-6);
% wyznaczenie czestosci drgan tlumionych
w=sqrt(1/(L*C));
b=R/(2*L);
wtl=sqrt(w^2-b^2);
% amplituda oraz funkcja napiecia
a=1;
Ue=a*sin(wtl*t);
% macierze A i B
A =[ -R/L, -1/L; 1/C, 0];
B = [1/L; 0];
% wynik
dX = A*X + B*Ue;
