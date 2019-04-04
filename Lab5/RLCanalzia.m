clc 
clear all
%definicja czasi
tk = 0.001;
tr = [0, tk];

y0 = [0; 0;];
% parametry ssytemu
R=4.7;
C=470*10^(-9);
L=220*10^(-6);
w=sqrt(1/(L*C));
b=R/(2*L);
wtl=sqrt(w^2-b^2);
A=1;
% wywolanie ode, rozwiazanie -> i, Uc
[t, y] = ode45('RLC1', tr, y0);

%macierze wyjscia z systemu
C = [1 0; 0 1; R 0; -R -1];
D = [0; 0; 0; 1];
Ue = A*sin(wtl*t);

X = C*y' + D*Ue';
X = X';
% X = RLCwyjscie(t, y); % ten wiersz robi to samo co te powy¿ej
%blad numeryczny
blad = Ue-X(:,4)-X(:,3)-X(:,2);

% wykres rozwiazania z ode - i oraz Uc
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

% wykres macierzy X - wyjscia z systemu [i, Uc, Ur, Ul)
figure(2)
subplot(4, 1, 1);
plot(t, X(:,1));
hold on
grid on
xlabel('Czas [s]');
ylabel('Prad w obwodzie [A]');
title('Prad')
subplot(4, 1, 2);
plot(t, X(:,2));
xlabel('Czas [s]');
ylabel('Napiecie [V]');
title('Napiecie na kondensatorze')
hold on
grid on
subplot(4, 1, 3);
plot(t, X(:,3));
hold on
grid on
xlabel('Czas [s]');
ylabel('Napiecie [V]');
title('Napiecie na oporniku');
subplot(4, 1, 4);
plot(t, X(:,4));
xlabel('Czas [s]');
ylabel('Napiecie [V]');
title('Napiecie na cewce');
hold on
grid on

%bl¹d
figure(3)
plot(t, blad);
xlabel('Czas [s]');
ylabel('blad');
title('blad');
hold on
grid on
