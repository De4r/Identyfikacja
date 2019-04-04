function dX=f1(t,X)

m=3;
k=2;
a=0.5;
w = sqrt(k/m);


A = [0, 1; -k/m 0];
B = [0; 1/m];
F = a*sin(w*t);

dX = A * X + B * F;
