clc
clear all
close all

s = 2;
ww = 1:1:10;
wk = ww';

A= [1:3; 4:6; 7:9]
B = [10:12; 13:15; 16:18]

A+B
A-B
A*B
A.*B
A\B

A^2
A.^2

ww1(3) = ww(end)
ww2 = ww + 10
ww3 = ww;

for i=1:2:length(ww)
    ww3(1,i)= ww(i)+1;
end
ww3

ww31 = ww;
for i=1:2:length(ww31)
    ww31(i) =ww31(i)+1;
end
ww31

ww4 = ww3.^2
ww5 = sqrt(ww3)
    
L = randn(3,3)
det(L)
O=inv(L)
L*O

A = [1 0 1; 2 1 0; 1 1 1];
B = [7;6;11]

X=inv(A)*B

C= [ (2:5).^2; (2:5).^3]

L2=rand(7,7)
w3=sum(L2(3,:))

triu(L2)
tril(L2)
diag(L2)

zer =zeros(100,100)
jedn = ones(100, 100)
oko= eye(100, 100)

det(zer)
det(jedn)
det(eye)

magiczna = magic(5)

t = 0:0.001:5
A= 2
f= 2
w=2*pi*f
y1= A*sin(w*t)
y2= ((sin(w*t)).^2).*((cos(w*t)).^2)
y3 = A*cos(w*t)

figure(1)
subplot(2,1,1)
plot(t,y1)
xlabel('czas [s]')
ylabel('amp')
title('title')
legend('aaa')
subplot(2,1,2)
plot(t,y2)
xlabel('czas [s]')
ylabel('amp')
title('title')
legend('aaa')
grid on


figure(3)
plot(t,y1)
hold on
plot(t,y3)
xlabel('czas [s]')
ylabel('amp')
title('title')
legend('sinus','cosinus')
grid on


figure(4)
plot3(y1,y3,t)
xlabel('sinus(wt)')
ylabel('cosinus(wt)')
zlabel('t')
grid on
legend('aa')
title('wykres  3d')
