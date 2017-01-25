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

function drX = g(x,t)
  #r = 126.62;
  r = 1;
  drX(1) = 10*(x(2) - x(1));
  drX(2) = r*x(1) -x(2) - x(1)*x(3);
  drX(3) = x(1)*x(2) - (8/3)*x(3);
endfunction

c = lsode("f",Xa,t);
d = lsode("f",Xb,t);
xa = c(:,1);
ya = c(:,2);
za = c(:,3);

xb = d(:,1);
yb = d(:,2);
zb = d(:,3);

figure 1
plot(t,xa,'g');
hold on;
plot(t,ya,'r');
plot(t,za,'b');
legend('x','y','z');
title('x,y,z VS Time (Condicion inicial a)');

figure 2
plot(t,xb,'g');
hold on;
plot(t,yb,'r');
plot(t,zb,'b');
legend('x','y','z');
title('x,y,z VS Time (Condicion inicial a r=1)');

figure 3
hold on
plot(za,xa,'k');
plot(zb,xb,'r');
legend('Condicion a // r = 126.62','Condicion a // r = 1');
title('Graficos de fase x VS z');

