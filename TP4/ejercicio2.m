# Ejercicio 2a con r = 126.62

Xa = [-7.69 -15.61 90.4]';
Xb = [-7.69 -15.61 90.5]';
t = [0:0.005:8]';

function dX = f(x,t)
  r = 126.62;
  #r = 1;
  dX(1) = 10*(x(2) - x(1));
  dX(2) = r*x(1) -x(2) - x(1)*x(3);
  dX(3) = x(1)*x(2) - (8/3)*x(3);
endfunction

c = lsode("f",Xa,t);
d = lsode("f",Xb,t);
xa = c(:,1);
ya = c(:,2);
za = c(:,3);

figure 1
plot(t,c(:,1),'g');
hold on;
#plot(t,c(:,2),'r');
plot(t,c(:,3),'b');
legend('x','z');
title('x,y,z VS Time (Condicion inicial a)');

figure 2
hold on
plot(c(:,2),c(:,1),'k');
plot(d(:,2),d(:,1),'r');
legend('Condicion a','Condicion b');
title('Graficos de fase x VS z');

figure 3
plot(t,d(:,1),'g');
hold on;
#plot(t,d(:,2),'r');
plot(t,d(:,3),'b');
legend('x','y','z');
title('x,z VS Time (Condicion inicial b)');

