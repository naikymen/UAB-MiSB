#Ejercicio 3
#Simulacioncita de un tanquecito de volumen constante con sustrato entrando
#Condicion inicial
Vol = 1
Co = 0;  # En molar
Cin = 1;  # En molar
F = 0.5;  # En litros por hora

#Rango de tiempo para resolver la ecuacion
tiempo =(0:0.1:30)';

#Defino la ecuacion diferencial
function dC = fder (cc,tt) #En matlab vv y tt estan en el orden inverso
  #Condicion inicial
  Co = 0;  # En molar
  Cin = 1;  # En molar
  F = 0.5;  # En litros por hora
  dC=F*Cin - F*cc;
endfunction;

#Resolver el sistema con valor inicial V0 y rango de tiempo temps
c=lsode("fder",Co,tiempo);


plot(tiempo,c);
xlabel("Tiempo (h)");
ylabel("Concentracion (M)");
title("Evolucion temporal de la concentracion");
legend("Conc.");
grid on;

#http://stackoverflow.com/questions/32098651/suppressing-printing-every-assignment

# https://www.gnu.org/software/octave/doc/v4.0.3/One_002ddimensional-Interpolation.html
# Interpolar
ci = interp1(tiempo,c,Vol/F)
ti = interp1(c,tiempo,0.5)

#Agregar lineas, no anda bien
#annotation("line",[0 1],[10 10])