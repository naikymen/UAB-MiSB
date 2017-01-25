#Ejercicio 2
#Condicion inicial
V0 = 1200;
#Rango de tiempo para resolver la ecuacion
t = (0:1:700)';

#Defino la ecuacion diferencial
function dV = fder (vv,tt) #En matlab vv y tt estan en el orden inverso
  Qe = 6;
  Qs = 8;
  dV=Qe-0.01*vv;
endfunction;

#Resolver el sistema con valor inicial V0 y rango de tiempo temps
x=lsode("fder",V0,temps);

#set term dumb;
plot(t,x)
xlabel("temps (min)");
ylabel("Volum (l)");
title("evolucion temporal del volumen");
legend("vol");
grid on;