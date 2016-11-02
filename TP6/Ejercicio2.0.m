# Reacciones Enzimaticas
# NO

Ao = 2.5;
Bo = 2.5;
Co = 0;
D0 = 0;

Xo = [Ao, Bo, Co, D0];

function dX = f(x,t)
  # A = 1, B = 2, C = 3, D = 4
  
  k1 = 1;
  k2 = 2;
  dX(1) = -k1*x(1) +(1/k1)*x(3)*x(3);
  dX(3) = +k1*x(1) -(1/k1)*x(3)*x(3) -k2*x(2)*x(3) +(1/k2)*x(4);
  dX(2) = -k2*x(2)*x(3) +(1/k2)*x(4);
  dX(4) = +k2*x(2)*x(3) -(1/k2)*x(4);
endfunction

t = [0:0.1:20]';
c = lsode(@f, Xo, t);

hold off
plot(t,c(:,1),'r')
hold on
plot(t,c(:,2),'g')
plot(t,c(:,3),'b')
plot(t,c(:,4),'k')
legend('A','B','C','D')