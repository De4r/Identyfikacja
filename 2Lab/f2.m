function dX=f2(t,X,w)

m=3;
k=2;
a=0.5;


A = [0, 1; -k/m 0];
B = [0; 1/m];
F = a*sin(w*t);

dX = A * X + B * F;
