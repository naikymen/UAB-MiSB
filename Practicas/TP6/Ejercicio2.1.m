# Reacciones Enzimaticas

Ao = 2.5;
Bo = 2.5;
Co = 0;
D0 = 0;

Xo = [Ao, Bo, Co, D0];

function dX = f(x,t)
  # A = 1, B = 2, C = 3, D = 4
  
  
  
  dX(1) = -(3.5 - (x(3)*x(3)) / x(1))
  dX(3) = +(3.5 - (x(3)*x(3)) / x(1)) -k2*x(2)*x(3) +(1/k2)*x(4)
  dX(2) = -k2*x(2)*x(3) +(1/k2)*x(4)
  dX(4) = +k2*x(2)*x(3) -(1/k2)*x(4)
endfunction

t = [0:0.1:20]';
c = lsode(@f, Xo, t);
plot(t,c(:,1))