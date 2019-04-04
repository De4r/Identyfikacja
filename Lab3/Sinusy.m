clc
clear all

t=0:0.01:100;
a=0.5;
w=0.5;
F11=a*sin(w*t);
F12=a*sin(w*t);
F21=a*sin(w*t);
F22=a*sin(w*t+pi/2);
F31=a*sin(w*t);
F32=a*sin(w*t+pi);

figure(1)
subplot(311)
plot(t, F11, t, F12)
title('wspol faza')
legend('F11','F12')
subplot(312)
plot(t, F21, t, F22)
title('naprzemiennie')
legend('F21','F22')
subplot(313)
plot(t, F31, t, F32)
title('przeciw faza')
legend('F31','F32')
