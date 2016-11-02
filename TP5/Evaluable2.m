# Eval 2

# Intento nested monod
# http://stackoverflow.com/questions/20402725/solving-nonlinear-equations-in-octave
# http://stackoverflow.com/questions/37890794/fsolve-error-no-function-or-method-found

# Variables
# Concentracion de A, B y C
Ao = 1;
Bo = 0;
Co = 0;
ci = [Ao; Bo; Co];

t = [0:30/200:30]';  # Horas
Vol = 1;  # Litro

function dX = f(x,t)
  k1 = 2;
  k3 = 0.2;
  Keq = 1;  # Y esto donde lo pongo?
  # De seguro va en las constantes de velocidad... k
  #k1 = @(z) z;
  dX(1) = -k1*x(1);
  dX(2) =  k1*x(1) - k3*x(2) - (1/k1)*x(2);
  dX(3) =  k3*x(2);
endfunction

c = lsode(@f,ci,t);
subplot(2,1,1)
hold on
plot(t,c(:,1),'r');
plot(t,c(:,2),'b');
plot(t,c(:,3),'g');
legend('A','B','C');
subplot(2,1,2)
plot(t,c(:,2)./c(:,1),'k');
legend('B/A');