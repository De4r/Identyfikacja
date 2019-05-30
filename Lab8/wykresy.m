function wykresy(y1,t,Fs,Ts,str)

y1min=min(y1);
y1max=max(y1);
y1mean=mean(y1);
y1var=var(y1);
y1std=std(y1);
y1E = sum(y1.^2);
y1P = y1E/(length(y1)-1);


figure('name',str)
subplot(2,3,1)
plot(t,y1)
xlabel('Czas [s]')
ylabel('Amplituda')
title('Przebieg czasowy');
text(0,0.5*y1max,['wartoœæ minimalna ' num2str(y1min)]);
text(0,0.4*y1max,['wartoœæ maksymalna ' num2str(y1max)]);
text(0,0.3*y1max,['wartoœæ srednia ' num2str(y1mean)]);
text(0,0.2*y1max,['waraincja ' num2str(y1var)]);
text(0,0.1*y1max,['odchylenie stand. ' num2str(y1std)]);
text(0,0.0*y1max,['energia ' num2str(y1E)]);
text(0,-0.1*y1max,['moc ' num2str(y1P)]);

subplot(2,3,2)
[akory1,lagy1] = xcorr(y1);
opy1=lagy1*Ts;
plot(opy1,akory1)
xlabel('Opoznienie [s]')
ylabel('Amplituda')
title('Autokorelacja sygnalu');

subplot(2,3,3)
wyswietl_fft(y1,Fs)
xlabel('Czestotliwoœæ [Hz]')
ylabel('Amplituda')
title('Widmo sygnalu');

subplot(2,3,4)
thd(y1,Fs)

subplot(2,3,5)
pwelch(y1,Fs)
