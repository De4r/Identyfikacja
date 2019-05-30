clc


% identyfikacja plikow tekstowych
Fp=48000; % Hz
tp=1/Fp;

plik1=fopen('wejscie_obiektu.txt','r');
wejscie=fscanf(plik1,'%f',Inf);
fclose(plik1);

plik2=fopen('wyjscie_obiektu.txt','r');
wyjscie=fscanf(plik2,'%f',Inf);
fclose(plik2);

t=0:tp:(length(wejscie)-1)*tp;

figure(1)
subplot(2,1,1)
plot(t,wejscie)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,1,2)
wyswietl_fft(wejscie,Fp);
title('Widmo wejscia')

figure(2)
subplot(2,1,1)
plot(t,wyjscie)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')

subplot(2,1,2)
wyswietl_fft(wyjscie, Fp);
title('Widmo wyjscia')

% macierz danych
data=iddata(wyjscie, wejscie, tp);

%okolo 90 procent dopasaowania, wyznaczenie transformaty
T=tfest(data, 2, 0) % dane, stopien mianownika , stopien licznika

T_s=tf(T.Numerator, T.Denominator);

istable(T_s)

[z,p,k] = tf2zp(T.Numerator, T.Denominator) %zero - miejsce 0 licznika, pole- miejsce zerowe mianownika

figure(5)
plot(real(z),imag(z),'mo')
hold on
plot(real(p), imag(p), 'b*')
grid on

figure(6)
nyquist(T_s); %amplitudowo fazowa

figure(7)
bode(T_s); %ampl-czest, i fazo-czest

%wyznaczanie
[H,w]=freqs(T.Numerator, T.Denominator, 1024);
f=w/(2*pi);

figure(8)
subplot(2,1,1)
semilogx(f,20*log10(abs(H)))
title('Char. amplt-czest.')
xlabel('log10(f) [Hz]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
semilogx(f,rad2deg(angle(H)))
grid on
title('Char. fazowo-czest.')
xlabel('log10(f) [Hz]')
ylabel('Faza')

%czaowe
figure(9)
impulse(T_s);


figure(10)
step(T_s);

%symulacje

y1=lsim(T_s, wejscie, t); % z tego mozna odtworzyc znowu fft

w1=500*2*pi;
wym=sin(w1*t);

y2=lsim(T_s, wym, t);

figure(11)
subplot(2,2,1)
plot(t,wym)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,2,3)
wyswietl_fft(wym, Fp)
title('Widmo wejscia')

subplot(2,2,2)
plot(t, y2)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')
subplot(2,2,4)
wyswietl_fft(y2, Fp)
title('Widmo wejscia')


w11=500*2*pi; w12=2000*2*pi; w13=5000*2*pi;
wym2=sin(w11*t)+sin(w12*t)+sin(w13*t);

y2=lsim(T_s, wym2, t);

figure(12)
subplot(2,2,1)
plot(t,wym2)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,2,3)
wyswietl_fft(wym2, Fp)
title('Widmo wejscia')

subplot(2,2,2)
plot(t, y2)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')
subplot(2,2,4)
wyswietl_fft(y2, Fp)
title('Widmo wejscia')




