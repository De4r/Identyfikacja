clc 

%definicja czasi
ts = 1e-8;
t0=0;
tk=0.001;
t=t0:ts:tk;
y0 = [0; 0;];

% parametry ssytemu
R=4.7;
C=470*10^(-9);
L=220*10^(-6);
w=sqrt(1/(L*C));
b=R/(2*L);
wtl=sqrt(w^2-b^2);
a=1;

A =[ -R/L, -1/L; 1/C, 0];
B = [1/L; 0];

Cu = [1 0; 0 1; R 0; -R -1];
Du = [0; 0; 0; 1];
Ue = a*sin(wtl*t);
wymuszenie = timeseries(Ue, t);

figure(1);
lsim(A,B,Cu,Du,Ue,t);

figure(2)
impulse(A,B,Cu,Du);

impulsowa = zeros(size(Ue));
impulsowa(1) = 1/ts;


Y=lsim(A,B,Cu,Du,impulsowa,t);
Y(1,:) = 0;

figure(3)
subplot(4,1,1)
plot(t,Y(:,1));
title('Prad - wyszmuenie impulsowe lsim');

subplot(4,1,2)
plot(t,Y(:,2));
title('Napiecie na kondensatorze');

subplot(4,1,3)
plot(t,Y(:,3));
title('Napiecie na cewce');

subplot(4,1,4)
plot(t,Y(:,4));
title('Napiecie na rezystorze');

figure(4)
step(A,B,Cu,Du);

sim('simulinik_model');

figure(5)
subplot(5,1,1)
plot(t, Ue);
title('Napiecie wymsuzenia - simulink');
subplot(5,1,2)
plot(t,I_s);
title('Prad');
subplot(5,1,3)
plot(t,Uc_s);
title('Napiecie na kondensatorze');
subplot(5,1,4)
plot(t,Ul_s);
title('Napiecie na cewce');
subplot(5,1,5)
plot(t,Ur_s);
title('Napiecie na rezystorze');

% skokowa

skokowa = ones(size(Ue));

skokowa(1:10000) = 0;


Y1=lsim(A,B,Cu,Du,skokowa,t);
Y1(1,:) = 0;

figure(6)
subplot(4,1,1)
plot(t,Y1(:,1));
title('Prad - skokowa lsim');
subplot(4,1,2)
plot(t,Y1(:,2));
title('Napiecie na kondensatorze');
subplot(4,1,3)
plot(t,Y1(:,3));
title('Napiecie na cewce');
subplot(4,1,4)
plot(t,Y1(:,4));
title('Napiecie na rezystorze');

% impulsowa i skokowa 

wymsuzenie = timeseries(impulsowa, t);


sim('simulinik_model');

figure(7)
subplot(5,1,1)
plot(t, impulsowa);
title('Napiecie wymsuzenia');
subplot(5,1,2)
plot(t(2:end),I_s(2:end));
title('Prad');
subplot(5,1,3)
plot(t(2:end),Uc_s(2:end));
title('Napiecie na kondensatorze');
subplot(5,1,4)
plot(t(2:end),Ul_s(2:end));
title('Napiecie na cewce');
subplot(5,1,5)
plot(t(2:end),Ur_s(2:end));
title('Napiecie na rezystorze');

wymuszenie = timeseries(skokowa, t);

sim('simulinik_model');

figure(8)
subplot(5,1,1)
plot(t, skokowa);
title('Napiecie wymsuzenia');
subplot(5,1,2)
plot(t(2:end),I_s(2:end));
title('Prad');
subplot(5,1,3)
plot(t(2:end),Uc_s(2:end));
title('Napiecie na kondensatorze');
subplot(5,1,4)
plot(t(2:end),Ul_s(2:end));
title('Napiecie na cewce');
subplot(5,1,5)
plot(t(2:end),Ur_s(2:end));
title('Napiecie na rezystorze');

%randowm
randomek = rand(size(Ue));
wymuszenie = timeseries(randomek, t);

sim('simulinik_model');

figure(9)
subplot(5,1,1)
plot(t, randomek);
title('Napiecie wymsuzenia - simulink random');
subplot(5,1,2)
plot(t(2:end),I_s(2:end));
title('Prad');
subplot(5,1,3)
plot(t(2:end),Uc_s(2:end));
title('Napiecie na kondensatorze');
subplot(5,1,4)
plot(t(2:end),Ul_s(2:end));
title('Napiecie na cewce');
subplot(5,1,5)
plot(t(2:end),Ur_s(2:end));
title('Napiecie na rezystorze');
