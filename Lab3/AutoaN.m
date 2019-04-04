clc
clear all

t0 = 0;
tk = 100;
tr = linspace(t0, tk, 10000);
y0= zeros(8,1);
T=2;
omega = 2*pi/T;
A = 0.05;

funkcja = @(t,y) auto_model(t,y,omega,A);

[t, y] = ode45(funkcja, tr, y0);

Tytul = ["Predk. kat. alfa","Predk. sr. masy yc","Predk. kola y5","Predk. kola y6","Przem. kat. alfa","Przem. sr. masy yc","Przem. kola y5","Przem. kola y6"];
Os = ["Predkosc katowa [rad/s]","Predkosc [m/s]","Predkosc [m/s]","Predkosc [m/s]","Przem. katowe [rad]","Przemieszczenie [m]","Przemieszczenie [m]","Przemieszczenie [m]"];
for i=1:4
    figure(i)
    subplot(211)
    plot(t, y(:,i))
    xlabel('Czas [s]')
    title(Tytul(i))
    ylabel(Os(i))
    subplot(212)
    plot(t, y(:,i+4))
    xlabel('Czas [s]')
    title(Tytul(i+4))
    ylabel(Os(i+4))
end