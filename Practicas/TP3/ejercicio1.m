# Ejercicio 2_3

h = 'hola';

function dX = f(x,t)
  k1 = 0.2;
  k2 = 0.142;
  dX(1) = -2*k1*(x(1)**2);
  dX(2) = k1*(x(1)**2) - k2*x(2);
  dX(3) = k2*x(2);
endfunction

Ao = 1;
Bo = 0;
Co = 0;

c0 = [Ao; Bo; Co];

t = [0:0.1:50]';

c = lsode("f",c0,t);

[Bmax pos] = max(c(:,2));
lBmax = (ones(size(t))).*Bmax;

AmC = A.-C;
teq = interp1(AmC,t,0)
Aeq = interp1(t,A,teq)

A = c(:,1);
B = c(:,2);
C = c(:,3);

plot(t,A,"r");
hold on
plot(t,B,"g");
plot(t,C,"b");
#plot(t,lBmax,'color','g','linestyle','--');
plot(t(pos),Bmax,'*','color','r');
plot(teq,Aeq,'*','color','r');
# https://www.gnu.org/software/octave/doc/v4.0.3/Two_002dDimensional-Plots.html
# https://www.gnu.org/software/octave/doc/v4.0.1/Plot-Annotations.html

xlabel("Tiempo (h)");
ylabel("Concentracion (M)");
title("Evolucion temporal de la concentracion");
legend("C","B","A");
grid on;
hold off;