function dX=RLCwyjscie(t, X)

R=4.7;
C=470*10^(-9);
L=220*10^(-6);

w=sqrt(1/(L*C));
b=R/(2*L);
wtl=sqrt(w^2-b^2);

A=1;

Ue=A*sin(wtl*t);

C = [1 0; 0 1; R 0; -R -1];
D = [0; 0; 0; 1];
for i=1:length(t)
    dX(:,i) = C*X(:,i) + D*Ue(i);
end
