#Ejemplo

h = 'hola'

function dX = f (x, t)
  k = 1.4;
  dX(1) = -x(1) +x(3);
  dX(2) = +x(1) -x(2);
  dX(3) = +x(2) -x(3);
endfunction

x0 = [10; 1; 1];

t = linspace (0, 50, 200)';

x = lsode ("f", x0, t);


plot(t,x(:,1));
xlabel("Tiempo (h)");
ylabel("Concentracion 1 (M)");
title("Evolucion temporal de la concentracion");
legend("Conc.");
grid on;

hold on
plot(t,x(:,2));