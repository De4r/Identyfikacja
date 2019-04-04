clc 
clear all
tk = 5;
tr = [0, tk];

y0 = [0; 0; 0; 0];
fi1 = [0 0 0 ];
fi2 = [0 pi/2 pi];

for i=1:3
    [t, y] = ode45(@(t,x) krazek3(t,x,fi1(i),fi2(i)), tr, y0);
    y = rad2deg(y);

    figure(1);
    subplot(2, 2, 1);
    plot(t, y(:,1));
    hold on
    grid on
    xlabel('Czas [s]');
    ylabel('Kat 1');
    title(['Przemieszczenie katowe dla 1 bloczka dla \omega_2=20 i zmienniego \phi'])
    legend(['\phi_2= ' num2str(fi2(1))], ['\phi_2= ' num2str(fi2(2))], ['\phi_2= ' num2str(fi2(3))])
    subplot(2, 2, 3);
    plot(t, y(:,2));
    xlabel('Czas [s]');
    ylabel('predkosc 1');
    legend(['\phi_2= ' num2str(fi2(1))], ['\phi_2= ' num2str(fi2(2))], ['\phi_2= ' num2str(fi2(3))])
    title(['Predkosc katowa dla 1 bloczka dla \omega_2=20 i zmienniego \phi'])
    hold on
    grid on
    subplot(2, 2, 2);
    plot(t, y(:,3));
    xlabel('Czas [s]');
    ylabel('Kat 2');
    legend(['\phi_2= ' num2str(fi2(1))], ['\phi_2= ' num2str(fi2(2))], ['\phi_2= ' num2str(fi2(3))])
    title(['Przemieszczenie katowe dla 2 bloczka dla \omega_2=20 i zmienniego \phi'])
    hold on
    grid on
    subplot(2, 2, 4);
    plot(t, y(:,4));
    xlabel('Czas [s]');
    ylabel('Predkosc katowa [\circ/s]');
    title(['Predkosc katowa dla 2 bloczka dla \omega_2=20 i zmienniego \phi'])
    legend(['\phi_2= ' num2str(fi2(1))], ['\phi_2= ' num2str(fi2(2))], ['\phi_2= ' num2str(fi2(3))])
    hold on
    grid on
end