clc
clear all

t0=0;
tk=100000;
tr = [t0 tk];
m = 2; k = 3;
t1 = linspace(t0, tk, 100000);
y0= [0; 0];
w0=sqrt(k/m);

[t1, y1] = ode23('f2', t1, y0);
[t2, y2] = ode45('f2', t1, y0);

figure(1)
subplot(211)
plot(t1, y1(:,1), t2, y2(:,1))
xlabel('Czas [s]')
ylabel('Przemieszcenie [m]')
legend('Ode23', 'Ode45')
subplot(212)
plot(t1, y1(:,2), t2, y2(:,2))
xlabel('Czas [s]')
ylabel('Prredkoœæ [m/s]')
legend('Ode23', 'Ode45')

% blad
figure(2)
subplot(211)
plot(t1, y1(:,1)-y2(:,1));
subplot(212)
plot(t1, y1(:,2)-y2(:,2));