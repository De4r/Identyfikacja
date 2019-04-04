function dQ = auto_model (t, Q, omega, A)

l1 = 1; l = 1.5; g = 9.81;
b9 = 10; b10 = 10.02;
k3 = 200; k4 = 200; k7 = 400; k8 = 405;
m11 = 750; m5 = 10; m6 = 10; J11 = 120;

x1 = A*sin(omega*t);
x2 = A*sin(omega*t + pi/6);


diagone = ones(4,1);
zera = zeros(4,4);
oness = diag(diagone);
dolna = [oness, zera];
alfa = [ -b10*(l-l1)^2, -b9*l1-b10*(l-l1), -b9*l1, b10*(l-l1), -k7*l1^2-k8*(l-l1)^2, k7*l1-k8*(l-l1), -k7*l1, k8*(l-l1)] / J11;
yc = [ -b10*(l-l1)+b9*l1, -b9-b10, b9, b10, k7*l1-k8*(l-l1), -k7-k8, k7, k8] / m11;
y5 = [ -b9*l1, b9, -b9, 0, k7*l1, k7, -k3-k7, 0] / m5;
y6 = [b10*(l-l1), b10, 0, -b10, k8*(l-l1), k8, 0, -k4-k8] / m6;

A = [alfa; yc; y5; y6; dolna];

B = zeros(8,3);
B(2:4,1) = -1;
B(3, 2) = k3/m5; B(4,3) = k4/m6;
F = [g; x1; x2];

dQ = A * Q + B * F;