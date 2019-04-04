function dQ = dwie_masy (t, Q, w, fi1, fi2)

w1=w; w2=w;
b1 = 1; b2 = 0.05; b3 = 0.5;
k1 = 2; k2 = 2; m1 = 3; m2 = 3;

A = [-(b1+b2+b3)/m1, (b2+b3)/m1, -(k1+k2)/m1, k2/m1;
    (b2+b3)/m2, -(b2+b3)/m2, k2/m2, -k1/m2;
    1, 0, 0, 0;
    0, 1, 0, 0;];
a1 = 0.5; a2 = 0.5;
F1 =  a1*sin(w1*t + fi1);
F2 =  a2*sin(w2*t + fi2);
F = [F1; F2];

B = [1/m1 0;0 1/m2;0 0;0 0;];
dQ = A * Q + B * F;