clc
clear all
close all

Q0 = [0 0];
t= linspace(0,10,1000);

[x y] = ode45(@masa_sprezyna, t, Q0)
plot(x,y(:,2))
