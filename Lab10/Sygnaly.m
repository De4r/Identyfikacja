clc
clear all
close all

Fs=48000;
Ts=1/Fs;
tk=2;
t=0:Ts:tk;

% 1) monoharmoniczny
f1=1000; %Hz
y1=sin(2*pi*f1*t);

wykresy(y1,t,Fs,Ts,'Sygnal harmoniczny')

% 2) poliharmoniczny
f=[50, 1000,5000];
y2=zeros(size(t));
y2p=zeros(size(t));

for i=1:length(f)
    y2p(i,:)=sin(2*pi*f(i)*t);
    y2 = y2 + y2p(i,:);
end

wykresy(y2,t,Fs,Ts,'Sygnal poliharmoniczny')
% 3) szum normlany

y3=randn(size(t));

wykresy(y3,t,Fs,Ts,'Szum normalny')
% 4) szum rownomierny

y4=rand(size(t));

wykresy(y4,t,Fs,Ts,'Szum rownomierny')
