clc
close all
clear all
format long
t = double(0:0.1:200);
a =2; w=1;
y1 = double(a*sin(w*t));
y2 =cos(w*t).*exp(t).*rand(size(t));

%dane do zapisania 2 wierszez i n kolumn
d_d_z = [t; y1];

p1 = fopen('plik2.txt', 'w'); % w w -wrie, r -read a -append
fprintf(p1,'%.15f %.15f %.15f\r\n', d_d_z); % format .5 .liczbamiejsc po przecinku
fclose(p1);

%odczyt
p1=fopen('plik2.txt', 'r');
d_o = fscanf(p1, '%f %f %f', [3 Inf]);
fclose(p1);

figure(1)
subplot(211)
plot(t, y1, d_o(1,:), d_o(2,:))
legend('orginalne', 'dane odczytane')
subplot(212)
plot(t, y2, d_o(1,:), d_o(3,:))
legend('orginalne', 'dane odczytane')

figure(2)
subplot(211)
plot(t, y1-d_o(2,:))
subplot(212)
plot(t, y2-d_o(3,:))
