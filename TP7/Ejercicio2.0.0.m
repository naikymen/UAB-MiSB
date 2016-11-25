#Practica 6 - Ejercicio 2

A = 1;
B = 0;
C = 0;
D = 0;
X0 = [A,B,C,D];
t = [0:0.01:1];

function dX = f(x,t)
  km = 0.1;
  Vm1 = 10;
  Vm2 = 5;
  Vm3 = 2.5;
  
  v = @(S,V) V*S/(S+km);
  
  dX(1) = -v(x(1),Vm1);  # A
  dX(2) = +v(x(1),Vm1) - v(x(2),Vm2) - v(x(2),Vm3);  # B
  dX(3) = +v(x(2),Vm2);  # C
  dX(4) = +v(x(2),Vm3);  # D
endfunction

c = lsode(@f,X0, t);


plot(t, c(:,1),'r');
hold on;
plot(t, c(:,2),'g');
plot(t, c(:,3),'b');
plot(t, c(:,4),'k');
legend('A','B','C','D');
hold off