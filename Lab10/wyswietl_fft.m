function wyswietl_fft(sygnal, Fp)

y=fft(sygnal);
L=2*floor(length(sygnal)/2);

P2 = abs(y/L);
P1=P2(1:(L/2)+1);
P1(2:end-1)=2*P1(2:end-1);

f=Fp* (0:(L/2))/L;

%plot
plot(f, P1)
%axis([0, 30000, 0, 1.1*max(P1)]);
xlabel('Czestotliwosc [Hz]');
ylabel('|P1(f)|');
grid on;

end
