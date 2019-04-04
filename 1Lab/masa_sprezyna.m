function dQ = masa_sprezyna(t, Q)

m = 1000;
k = 10000;
F= -10000;
b = 200;
A = [-0 -k/m; 1 0];
B = [ 1/m; 0];


dQ = A*Q + B*F;