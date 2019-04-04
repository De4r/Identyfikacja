clc 
clear all
tk = 0.001;
tr = [0, tk];

y0 = [0; 0;];

R=4.7;
C=470*10^(-9);
L=220*10^(-6);
w=sqrt(1/(L*C));
b=R/(2*L);
wtl=sqrt(w^2-b^2);
A=1;

[t, y] = ode45('RLC1', tr, y0);

C = [1 0; 0 1; R 0; -R -1];
D = [0; 0; 0; 1];


Ue = A*sin(wtl*t);
Ur = -R*y(:,1);
Ul = Ue-Ur-y(:,2);

X = C*y' + D*Ue';

blad = Ue -Ul -y(:,2) -Ur;

figure(1);
subplot(2, 1, 1);
plot(t, y(:,1));
hold on
grid on
xlabel('Czas [s]');
ylabel('Prad w obwodzie [A]');
title('Prad')
subplot(2, 1, 2);
plot(t, y(:,2));
xlabel('Czas [s]');
ylabel('Napiecie  na kondensatorze [V]');
title('Napiecie')
hold on
grid on

figure(2);
subplot(3, 1, 1);
plot(t, Ur);
hold on
grid on
xlabel('Czas [s]');
ylabel('Napiecie  na oporniku [V]');
title('Napiecie');
subplot(3, 1, 2);
plot(t, Ul, t, y(:,2));
xlabel('Czas [s]');
ylabel('Napiecie [V]');
title('Napiecie');
legend('Ul', 'Uc')
hold on
grid on
subplot(3, 1, 3);
plot(t, Ue);
xlabel('Czas [s]');
ylabel('Napiecie zasialania [V]');
title('Napiecie');
hold on
grid on

figure(3)
plot(t, blad);
xlabel('Czas [s]');
ylabel('blad');
title('blad');
hold on
grid on

figure(4)
subplot(4, 1, 1);
plot(t, y(:,1));
hold on
grid on
xlabel('Czas [s]');
ylabel('Prad w obwodzie [A]');
title('Prad')
subplot(4, 1, 2);
plot(t, y(:,2));
xlabel('Czas [s]');
ylabel('Napiecie  na kondensatorze [V]');
title('Napiecie')
hold on
grid on
subplot(4, 1, 3);
plot(t, Ur);
hold on
grid on
xlabel('Czas [s]');
ylabel('Napiecie  na oporniku [V]');
title('Napiecie');
subplot(4, 1, 4);
plot(t, Ul, t, y(:,2));
xlabel('Czas [s]');
ylabel('Napiecie [V]');
title('Napiecie');
legend('Ul', 'Uc')
hold on
grid on
