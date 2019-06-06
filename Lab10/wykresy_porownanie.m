function wykresy_porownanie(t1, wyj, y2, Fp, typ)


subplot(2,2,1)
plot(t1,wyj)
xlabel('Czas [s');
ylabel('Amplituda');
title('Przebieg sygnalu wyjscia rzeczywistego')

subplot(2,2,3)
wyswietl_fft(wyj, Fp)
title('Widmo wyjscia rzeczywsitego')

subplot(2,2,2)
plot(t1, y2)
xlabel('Czas [s');
ylabel('Amplituda');
title(['Przebieg sygnalu wyjscia z modelu -' typ])
subplot(2,2,4)
wyswietl_fft(y2, Fp)
title(['Widmo wejscia - ' typ])