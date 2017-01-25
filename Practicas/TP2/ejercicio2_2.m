# ejercicio 2 en Octave
# tres tanques

h = 'hola';

function dX = f (x, t)
  F = 1;
  dX(1) = -F*x(1)/50 +F*x(3)/50;
  dX(2) = -F*x(2)/20 +F*x(1)/50;
  dX(3) = +F*x(2)/20 -F*x(3)/50;
endfunction;

x0 = [10; 8; 5];

t = (0:0.5:200)';

c = lsode("f",x0,t);

plot(t,c(:,3)./5);
hold on
plot(t,c(:,2)./2);
plot(t,c(:,1)./5);

xlabel("Tiempo (h)");
ylabel("Concentracion (M)");
title("Evolucion temporal de la concentracion");
legend("Conc.");
grid on;