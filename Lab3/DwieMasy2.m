clc
clear all

t0 = 0;
tk = 100;
tr = linspace(t0, tk, 10000);
y0= [0; 0; 0; 0];
w = [0.1, 0.5, 1, 2, 10];
fi1=0;
fi2=pi;
k=1;
for i=1:4:4*length(w)
    [t1,y1(:,i:i+3)] = ode45(@(t,x) dwie_masy(t,x,w(k),fi1,fi2),tr,y0);
    k= k +1;
end
k=1;
for i=1:4:4*length(w)
    figure(k)
    subplot(221)
    plot(t1,y1(:,i))
    xlabel('Czas [s]')
    ylabel('Predkoœæ [m/s]')
    title(['Predkosci masy m1 dla w=' num2str(w(k)) ' i fi=' num2str(fi1)])
    grid on
    subplot(222)
    plot(t1,y1(:,i+1))
    xlabel('Czas [s]')
    ylabel('Predkoœæ [m/s]')
    title(['Predkosci masy m2 dla w=' num2str(w(k)) ' i fi=' num2str(fi2)])
    grid on
    subplot(223)
    plot(t1,y1(:,i+2))
    xlabel('Czas [s]')
    ylabel('Przemieszcenie [m]')
    title(['Przemieszczenia masy m1 dla w=' num2str(w(k)) ' i fi=' num2str(fi1)])
    grid on
    subplot(224)
    plot(t1,y1(:,i+3))
    xlabel('Czas [s]')
    ylabel('Przemieszcenie [m]')
    title(['Przemieszczenia masy m2 dla w=' num2str(w(k)) ' i fi=' num2str(fi2)])
    grid on
    k=k+1;
end