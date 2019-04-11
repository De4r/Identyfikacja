clc 

%definicja czasi
ts = 1e-8;
t0=0;
tk=0.001;
t=t0:ts:tk;

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

for i=1:4
    switch i
        case 1
            wymuszenie = timeseries(Ue,t);
        case 2
            impulsowa = zeros(size(Ue));
            impulsowa(1) = 1/ts;
            wymsuzenie = timeseries(impulsowa, t);
        case 3
            skokowa = ones(size(Ue));
            skokowa(1:10000) = 0;
            wymsuzenie = timeseries(skokowa, t);
        case 4
            randomek = rand(size(Ue));
            wymuszenie = timeseries(randomek, t);
    end

    sim('model_simulinik')

    figure(i)
    subplot(5,1,1)
    plot(wymsuzenie);
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
end