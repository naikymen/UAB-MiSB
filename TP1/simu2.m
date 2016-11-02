#Define the ODE:
function xdot = f (x,t)
  xdot=-exp(-t)*x^2;
endfunction
# Numerical Solution on (0,5):
x=lsode("f",2,(t=linspace(0,5,50)'));
#Comment:  Here 50 points are used the inteval [0,5].

#Simulacioncita
#Condicion inicial
V0 = 1200;
#Rango de tiempo para resolver la ecuacion
t=(0:1:700)';

function xdot = fder (tt,vv)
  Qe = 6
  Qs = 8
  xdot=Qe-Qs;
endfunction

x=lsode("fder",V0,t);

#set term dumb;
plot(t,x)
xlabel("temps (min)")
ylabel("Volum (l)")
title("evolucion temporal del volumen")
legend("vol")
grid on