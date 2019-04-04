clc
clear all

t0 = 0;
tk = 100;
tr = linspace(t0, tk, 10000);
y0= [0; 0; 0; 0];
w = 0.5;
fi1=[0, 0, 0];
fi2=[0, pi/2, pi];
k=1;
for i=1:4:4*length(fi1)
    [t1,y1(:,i:i+3)] = ode45(@(t,x) dwie_masy(t,x,w,fi1(k),fi2(k)),tr,y0);
    k= k +1;
end
k=1;
for i=1:4:4*length(fi1)
    figure(1)
    subplot(221)
    plot(t1,y1(:,i))
    xlabel('Czas [s]')
    ylabel('Predkoœæ [m/s]')
    title(['Predkosci masy m1 dla w=' num2str(w)])
    legend(['fi2=' num2str(fi2(1))],[ 'fi2=' num2str(fi2(2))],[ 'fi2=' num2str(fi2(3))]);
    grid on
    hold on
    subplot(222)
    plot(t1,y1(:,i+1))
    xlabel('Czas [s]')
    ylabel('Predkoœæ [m/s]')
    title(['Predkosci masy m2 dla w=' num2str(w)])
    grid on
    hold on
    subplot(223)
    plot(t1,y1(:,i+2))
    xlabel('Czas [s]')
    ylabel('Przemieszcenie [m]')
    title(['Przemieszczenia masy m1 dla w=' num2str(w)])
    grid on
    hold on
    subplot(224)
    plot(t1,y1(:,i+3))
    xlabel('Czas [s]')
    ylabel('Przemieszcenie [m]')
    title(['Przemieszczenia masy m2 dla w=' num2str(w)])
    grid on
    k=k+1;
    hold on
end