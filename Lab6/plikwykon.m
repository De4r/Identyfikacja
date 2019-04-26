clc;
clear all;
close all;

tk = 100;
t0 = 0;
dt = 1e-2;
t = t0:dt:tk;

m1 = 3;
m2 = 0.5;
k1 = 2;
k2 = 2;
c1 = 0.2;
c2 = 1;

w = 0.3;
a = 1;

f1 = zeros(1, length(t));
f2 = a * sin(w*t);

wymuszenie1 = timeseries(f1, t);
wymuszenie2 = timeseries(f2, t);
sim('masasprezynasimulink.slx');

figure(1);%sinus
subplot(4, 2, [1, 2]);
title('wymuszenie harmoniczne')
plot(t, f1);legend('wymuszenie1');
subplot(4, 2, [3, 4]);
plot(t, f2);legend('wymuszenie2');
subplot(4, 2, 5);
plot(t, y1); legend('przemieszczenie1');
subplot(4, 2, 6);
plot(t, y2); legend('przedkosc1');
subplot(4, 2, 7);
plot(t, y3); legend('przemieszczenie2');
subplot(4, 2, 8);
plot(t, y4); legend('predkosc2');
%%%%%%%%%%%%%% delta kroneckera


f1 = zeros(1, length(t));
f2 = zeros(1, length(t));
f2(1, 100) = 1/dt;
wymuszenie1 = timeseries(f1, t);
wymuszenie2 = timeseries(f2, t);
sim('masasprezynasimulink.slx');

figure(2); 
subplot(4, 2, [1, 2]);
title('wymuszenie delta kroneckera')
plot(t, f1);legend('wymuszenie1');
subplot(4, 2, [3, 4]);
plot(t, f2);legend('wymuszenie2');
subplot(4, 2, 5);
plot(t, y1); legend('przemieszczenie1');
subplot(4, 2, 6);
plot(t, y2); legend('przedkosc1');
subplot(4, 2, 7);
plot(t, y3); legend('przemieszczenie2');
subplot(4, 2, 8);
plot(t, y4); legend('predkosc2');

%%%%%%%%%%%%%% step
f1 = zeros(1, length(t));
f2 = zeros(1, length(t));
f2(1, 1000:10001) = 1/dt;
wymuszenie1 = timeseries(f1, t);
wymuszenie2 = timeseries(f2, t);
sim('masasprezynasimulink.slx');
figure(3); 
subplot(4, 2, [1, 2]);
title('wymuszenie stepem')
plot(t, f1);legend('wymuszenie1');
subplot(4, 2, [3, 4]);
plot(t, f2);legend('wymuszenie2');
subplot(4, 2, 5);
plot(t, y1); legend('przemieszczenie1');
subplot(4, 2, 6);
plot(t, y2); legend('przedkosc1');
subplot(4, 2, 7);
plot(t, y3); legend('przemieszczenie2');
subplot(4, 2, 8);
plot(t, y4); legend('predkosc2');
%%%%%%%%%%% szum
f1 = zeros(1, length(t));
f2 = zeros(1, length(t));
f2(1, :) = rand([1, length(t)]);
wymuszenie1 = timeseries(f1, t);
wymuszenie2 = timeseries(f2, t);
sim('masasprezynasimulink.slx');
figure(4); 
subplot(4, 2, [1, 2]);
title('wymuszenie stepem')
plot(t, f1);legend('wymuszenie1');
subplot(4, 2, [3, 4]);
plot(t, f2);legend('wymuszenie2');
subplot(4, 2, 5);
plot(t, y1); legend('przemieszczenie1');
subplot(4, 2, 6);
plot(t, y2); legend('przedkosc1');
subplot(4, 2, 7);
plot(t, y3); legend('przemieszczenie2');
subplot(4, 2, 8);
plot(t, y4); legend('predkosc2');