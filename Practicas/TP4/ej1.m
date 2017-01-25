
Xa = [-7.69 -15.61 90.4]';
Xb = [-7.69 -15.61 90.5]';
t = [0:0.005:8]';

function dX = f(x,t)
  r = 126.62;
  #r = 1
  dX(1) = 10*(x(2) - x(1));
  dX(2) = r*x(1) -x(2) - x(1)*x(3);
  dX(3) = x(1)*x(2) - (8/3)*x(3);
endfunction

c = lsode("f",Xa,t);
d = lsode("f",Xb,t);

figure
plot(t,c(:,1),'g');
hold on;
plot(t,c(:,2),'r');
plot(t,c(:,3),'b');
legend('x','y','z');
title('x,y,z VS Time (CI: a)');

figure
plot(c(:,2),c(:,1));
legend('x VS z');
title('CI: a');

figure
plot(t,d(:,1),'g');
hold on;
plot(t,d(:,2),'r');
plot(t,d(:,3),'b');
legend('x','y','z');
title('x,y,z VS Time (CI: b)');

figure
plot(d(:,2),d(:,1));
legend('x VS z');
title('CI: b');