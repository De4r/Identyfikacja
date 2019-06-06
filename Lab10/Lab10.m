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

figure(5)
plot(op, acor)
title('Korelacja wzajemna')
xlabel('Opoznienie [s]')
ylabel('Amplituda')
%%

%% identyfikacja modelami - AR
data=iddata(wyjscie,[],tp);
rzad = [];
dopasowanie_ar =[];

for i=1:20
    sys_ar=ar(data,i);
    rzad(i,1) = i;
    dopasowanie_ar(i,1) =  sys_ar.Report.Fit.FitPercent;
end

figure(6)
plot(rzad, dopasowanie_ar)
grid on
xlabel('Rzad [-]');
ylabel('Dopasowanie [%]');
title('Dopasowanie dla modelu AR');

%% identyfikacja modelami - ARX
data = iddata(wyjscie, wejscie, tp);
blad_arx =[];
rzad_a = 3:6; rzad_b =1:5; 
for i=1:length(rzad_a)
    
    for j=1:length(rzad_b)
        
        sys_arx = arx(data, [rzad_a(i) rzad_b(j) 1]);
        blad_arx(i, j) = sys_arx.Report.Fit.FitPercent;
        
    end
end

figure(7)
surf(rzad_b, rzad_a, blad_arx)
grid on
xlabel('Rzad B [-]');
ylabel('Rzad A [-]');
zlabel('Dopasowanie [%]');
title('Dopasowanie dla modelu ARX');

%% identyfikacja modelami - OE
a_oe = 3; b_oe = 4;

sys_oe = oe(data, [a_oe b_oe 1])

%% identyfikacja modelami - Box Jenkins
a_bj = 3; b_bj = 4; c_bj = 2; d_bj = 2;
 
sys_bj = bj(data, [a_bj b_bj c_bj d_bj 1])

%% identyfikacja modelami - moedl theta
a_th = 3; b_th = 4; c_th = 2; d_th = 2; e_th = 1;

sys_polyest = polyest(data, [a_th b_th c_th d_th e_th 1])


%% porownianie modeli
%%arx
y_arx = lsim(sys_arx, wejscie, t1);

figure(8)
wykresy_porownanie(t1, wyjscie, y_arx, Fp, 'ARX')

%%oe
y_oe = lsim(sys_oe, wejscie, t1);

figure(9)
wykresy_porownanie(t1, wyjscie, y_oe, Fp, 'OE')

%%bj
y_bj = lsim(sys_bj, wejscie, t1);

figure(10)
wykresy_porownanie(t1, wyjscie, y_bj, Fp, 'BJ')

%%polyest
y_polyest = lsim(sys_polyest, wejscie, t1);

figure(11)
wykresy_porownanie(t1, wyjscie, y_polyest, Fp, 'THETA')

%% transmitancja

data=iddata(wyjscie, wejscie, tp);

%okolo 90 procent dopasaowania, wyznaczenie transformaty
T=tfest(data, 4, 2) % dane, stopien mianownika , stopien licznika

T_s=tf(T.Numerator, T.Denominator);

isstable(T_s)

[z,p,k] = tf2zp(T.Numerator, T.Denominator) %zero - miejsce 0 licznika, pole- miejsce zerowe mianownika

figure(12)
plot(real(z),imag(z),'mo')
hold on
plot(real(p), imag(p), 'b*')
grid on

figure(13)
nyquist(T_s); %amplitudowo fazowa

figure(14)
bode(T_s); %ampl-czest, i fazo-czest

%%
y2=lsim(T_s, wejscie, t1);
figure(15)
wykresy_porownanie(t1, wyjscie, y2, Fp, 'TF_EST')
