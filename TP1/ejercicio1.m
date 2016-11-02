#Ejercicio 1
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