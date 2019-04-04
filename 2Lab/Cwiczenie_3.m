clc
clear all

%czas, parametry
t0=0;
tk=100;
tr = [t0 tk];
m = 3; k = 2;
t1 = linspace(t0, tk, 1000);
y0= [0; 0]; % warunki poczatkowe
w0=sqrt(k/m);
w=[w0/3 w0 2*w0];


%wyznaczenie dla kilku omeg
k=1;
for i=1:2:2*length(w)
    [t2, y2(:,i:i+1)] = ode45(@(t,x) f2(t,x,w(k)), t1, y0);
    k=k+1;
end

%wykresy
k=1;
for i=1:2:5
    figure(k)
    subplot(211)
    plot(t2, y2(:,i))
    xlabel('Czas [s]')
    ylabel('Przemieszcenie [m]')
    title(['Wykres przemieszczenia dla w=' num2str(w(k))])
    subplot(212)
    plot(t2, y2(:,i+1))
    xlabel('Czas [s]')
    ylabel('Prredkoœæ [m/s]')
    title(sprintf('Wykres predkosci dla w=%f',w(k)))
    k=k+1
end