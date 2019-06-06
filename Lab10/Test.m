clc
clear all
close all

Fp=48000; % Hz
tp=1/Fp;

plik1=fopen('we_obiekt3.txt','r');
wejscie=fscanf(plik1,'%f',Inf);
fclose(plik1);

plik2=fopen('wy_obiekt3.txt','r');
wyjscie=fscanf(plik2,'%f',Inf);
fclose(plik2);

t=0:tp:(length(wejscie)-1)*tp;

% wykresy przebiegu czasowego
%%
figure(1)
subplot(2,2,1)
plot(t,wejscie)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,2,3)
wyswietl_fft(wejscie,Fp);
title('Widmo wejscia')

subplot(2,2,2)
plot(t,wyjscie)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')

subplot(2,2,4)
wyswietl_fft(wyjscie, Fp);
title('Widmo wyjscia')
%%

% wyznaczenie korelacji ze wzglêdu na wystêpuj¹ce opoznienie

% funkcja korelacja
[acor, lag] = xcorr(wyjscie,wejscie);
op = lag*tp;

figure(3)
plot(op, acor)
title('Korelacja wzajemna')
xlabel('Opoznienie [s]')
ylabel('Amplituda')

%poszukiwanie opoznienia

[~, I] = max(abs(acor));

probka = lag(I) - 2 % 2 probki bo to opoznienie komputera

% wycinanie poczatka i konca 
wejscie = wejscie(1:end-probka+1);
wyjscie = wyjscie(probka:end);
t1 = 0:tp:(length(wejscie)-1)*tp;
%%

% Ponowne wyrysowanie wejscia i wyjscia
figure(4)
subplot(2,2,1)
plot(t1,wejscie)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,2,3)
wyswietl_fft(wejscie,Fp);
title('Widmo wejscia')


subplot(2,2,2)
plot(t1,wyjscie)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')

subplot(2,2,4)
wyswietl_fft(wyjscie, Fp);
title('Widmo wyjscia')
%%

%funkcja korelacja
[acor, lag] = xcorr(wyjscie,wejscie);
op = lag*tp;

figure(6)
plot(op, acor)
title('Korelacja wzajemna')
xlabel('Opoznienie [s]')
ylabel('Amplituda')
%%

%IDENTYFIKACJA
%macierz danych
data=iddata(wyjscie, wejscie, tp);

%okolo 90 procent dopasaowania, wyznaczenie transformaty
T=tfest(data, 3, 1) % dane, stopien mianownika , stopien licznika

T_s=tf(T.Numerator, T.Denominator);

istable(T_s)

[z,p,k] = tf2zp(T.Numerator, T.Denominator) %zero - miejsce 0 licznika, pole- miejsce zerowe mianownika

figure(7)
plot(real(z),imag(z),'mo')
hold on
plot(real(p), imag(p), 'b*')
grid on

%%

figure(8)
nyquist(T_s); %amplitudowo fazowa

figure(9)
bode(T_s); %ampl-czest, i fazo-czest

%wyznaczanie
[H,w]=freqs(T.Numerator, T.Denominator, 1024);
f=w/(2*pi);

figure(10)
subplot(2,1,1)
semilogx(f,20*log10(abs(H)))
title('Char. amplt-czest.')
xlabel('log10(f) [Hz]')
ylabel('Amplituda')
grid on
subplot(2,1,2)
semilogx(f,unwrap(rad2deg(angle(H))))
grid on
title('Char. fazowo-czest.')
xlabel('log10(f) [Hz]')
ylabel('Faza')

%czaowe
figure(11)
impulse(T_s);


figure(12)
step(T_s);

%%

%symulacje


w1=500*2*pi;
wym=sin(w1*t1);


y2=lsim(T_s, wym, t1);

figure(13)
subplot(2,2,1)
plot(t1,wym)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,2,3)
wyswietl_fft(wym, Fp)
title('Widmo wejscia')

subplot(2,2,2)
plot(t1, y2)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')
subplot(2,2,4)
wyswietl_fft(y2, Fp)
title('Widmo wejscia')


w11=500*2*pi; w12=2000*2*pi; w13=5000*2*pi;
wym2=sin(w11*t1)+sin(w12*t1)+sin(w13*t1);

y2=lsim(T_s, wym2, t1);

figure(14)
subplot(2,2,1)
plot(t1,wym2)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,2,3)
wyswietl_fft(wym2, Fp)
title('Widmo wejscia')

subplot(2,2,2)
plot(t1, y2)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')
subplot(2,2,4)
wyswietl_fft(y2, Fp)
title('Widmo wyjscia')



y1=lsim(T_s, wejscie, t1); % z tego mozna odtworzyc znowu fft

figure(15)
subplot(2,2,1)
plot(t1,wejscie)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wejscia')

subplot(2,2,3)
wyswietl_fft(wejscie, Fp)
title('Widmo wejscia')

subplot(2,2,2)
plot(t1, y1)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia')
subplot(2,2,4)
wyswietl_fft(y1, Fp)
title('Widmo wyjscia')