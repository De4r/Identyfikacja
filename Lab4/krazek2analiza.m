clc 
clear all
tk = 5;
tr = [0, tk];

y0 = [0; 0; 0; 0];
w=[2 10 20 40];

for i=1:4
    [t, y] = ode45(@(t,x) krazek2(t,x,w(i)), tr, y0);
    y = rad2deg(y);

    figure(i);
    subplot(2, 2, 1);
    plot(t, y(:,1));
    hold on
    grid on
    xlabel('Czas [s]');
    ylabel('Przemieszczenie k¹towe [\circ]');
    title(['Przemieszczenie katowe dla 1 bloczka dla \omega_2=' num2str(w(i))])
    subplot(2, 2, 3);
    plot(t, y(:,2));
    xlabel('Czas [s]');
    ylabel('Predkosc katowa [\circ/s]');
    title('Predkosc katowa dla 1 bloczka')
    title(['Predkosc katowa dla 1 bloczka dla \omega_2=' num2str(w(i))])
    grid on
    hold on
    subplot(2, 2, 2);
    plot(t, y(:,3));
    xlabel('Czas [s]');
    ylabel('Przemieszczenie k¹towe [\circ]');
    title(['Przemieszczenie katowe dla 2 bloczka dla \omega_2=' num2str(w(i))])
    grid on
    hold on
    subplot(2, 2, 4);
    plot(t, y(:,4));
    xlabel('Czas [s]');
    ylabel('Predkosc katowa [\circ/s]');
    title('Predkosc katowa dla 2 bloczka')
    title(['Predkosc katowa dla 2 bloczka dla \omega_2=' num2str(w(i))])
    grid on
    hold on
end