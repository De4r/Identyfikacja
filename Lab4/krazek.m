function dX=krazek(t, x)

%
I1 = 1;
I2 = 1.5;
K1 = 1.5*10^5;
K2 = 2*10^4;
h1 = 3*10^4;
h2 = 5*10^4;
h3=h1;

M =zeros(4,4);
M(1,1) = 1;
M(2,2) =I1;
M(3,3) = 1;
M(4,4) = I2;

w=20;

M0=500;

M1 =  0;
M2 = M0*sin(w*t);

W=[x(2);
    -K1*x(1)+K2*(x(3)-x(1))+h2*(x(4)-x(2))-h3*x(2)+M1;
    x(4);
    -K2*(x(3)-x(1))-h1*x(4)-h2*(x(4)-x(2))+M2];

dX = M \ W;