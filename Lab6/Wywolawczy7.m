clc
clear all

t0=0;
tk=100;
ts=1e-2;

t=t0:ts:tk;
a=1;

m1=3; m2=0.5;
c1=0.2; c2=1;
k1=2; k2=2;

w=0.3;
F1=a*sin(w*t);
F2=a*sin(w*t+pi/2);
wym1=timeseries(F1,t);
wym2=timeseries(F2, t);

sim('Model')

figure(7)
subplot(4,2,[1,2])
plot(t, F1)
title('Wymuszenie F1')
xlabel('Czas [s]')
ylabel('Sila [N]')
grid on

subplot(4,2,[3,4])
plot(t, F2)
title('Wymuszenie F2')
xlabel('Czas [s]')
ylabel('Sila [N]')
grid on

subplot(4,2,5)
plot(t, x1)
title('Przemieszcenie masy m1')
xlabel('Czas [s]')
ylabel('Przemieszcenie [m/s]')
grid on

subplot(4,2,6)
plot(t, x1p)
title('Predkosc masy m1')
xlabel('Czas [s]')
ylabel('Predkosc [m/s]')
grid on

subplot(4,2,7)
plot(t, x2)
title('Przemieszczenie masy m2')
xlabel('Czas [s]')
ylabel('Przemieszczenie [m/s]')
grid on

subplot(4,2,8)
plot(t, x2p)
title('Predkosc masy m2')
xlabel('Czas [s]')
ylabel('Predkosc [m/s]')
grid on