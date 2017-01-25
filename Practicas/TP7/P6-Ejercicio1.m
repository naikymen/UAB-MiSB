#Practica 6 - Ejercicio 1

E = 1;
S = 10;
ES = 0;
P = 0;
X0 = [E, S, ES, P, S, P];

function dX = f(x,t)
  k1 = 20;
  j1 = 1;
  k2 = 10;
  j2 = 0;
  
  Km = @(i) (k2+j1)/k1;
  Vmax = @(i) (1*k2);
  
  dX(1) = -k1*x(1)*x(2) + j1*x(3) + k2*x(3);  # Enzima
  dX(2) = -k1*x(1)*x(2) + j1*x(3);  # Sustrato
  dX(3) = +k1*x(1)*x(2) - j1*x(3) - k2*x(3);  # ES
  dX(4) = +k2*x(3);
  
  dX(5) = -Vmax(1)*(x(5))/(Km(1)+x(5));  # MM sustrato
  dX(6) = +Vmax(1)*(x(5))/(Km(1)+x(5));  # MM producto
endfunction

t = [0:0.005:1.4]';

c = lsode(@f,X0,t);

plot(t, c(:,4),'r');
hold on;
plot(t, c(:,1),'g');
plot(t, c(:,2),'b');
plot(t, c(:,3),'k');
plot(t, c(:,5),'color','b','linestyle','--');  # MM Sustrato
plot(t, c(:,6),'color','r','linestyle','--');  # MM Prodcuto
legend('p','e','s','es','s MM','p MM');
hold off