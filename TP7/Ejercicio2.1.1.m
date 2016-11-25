#Practica 6 - Ejercicio 2
# Con salidas y entradas
# y multiplicacion de matrices
A = 1;
B = 0;
C = 0;
D = 0;
X0 = [A,B,C,D];
t = [0:0.01:3];

function dX = f(x,t)
  km = 0.1;
  Vm1 = 10;
  Vm2 = 5;
  Vm3 = 2.5;
  
  v = @(s,vmax) vmax*s/(s+km);
  
  S = [
     -1  0  0  1  0  0;
     1  -1 -1  0  0  0;
     0   1  0  0 -1  0;
     0   0  1  0  0 -1 ];
  V = [
    v(x(1),Vm1);
    v(x(2),Vm2);
    v(x(2),Vm3);
    0.05;
    0.1*x(3);
    0.1*x(4)];
  
  dX = S*V;
endfunction

c = lsode(@f,X0, t);

figure 2
plot(t, c(:,1),'r');hold on;
plot(t, c(:,2),'g');
plot(t, c(:,3),'b');
plot(t, c(:,4),'k');

'Concentraciones en estado estacionario: A, B, C y D'
[x,info] = fsolve(@f,X0); x

plot(0.2,x(1),'r*','linewidth',5)
plot(0.3,x(2),'g*','linewidth',5)
plot(3,x(3),'b*','linewidth',5)
plot(3,x(4),'k*','linewidth',5)

legend('A','B','C','D','A final','B final','C final','D final');
title('(-) A,B,C,D Con entradas y salidas //  (*) Valores de estdo estacionario')

hold off