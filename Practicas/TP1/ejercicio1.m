#Ejercicio 1

# correccion: faltaba la condicion inicial y el vector tiempo
V0 = 1200;
t = (0:1:700)';

function xdot = fder (tt,vv)
  Qe = 6;
  Qs = 8;
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