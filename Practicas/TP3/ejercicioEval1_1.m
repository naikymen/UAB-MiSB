# Ejercicio Evaluable 1
# Reactor Monod

h = 'hola'




# Variables
# X (concentracion de biomasa)
# S (concentracion de sustrato)
# y Sout ?

# El sustrato
# Tiene inputs de 1.5 mmol/h
# Tiene outputs que dependen de X (y de rs) y de S (canal de salida)

mux = 0.3;
Km = 0.2;

# La biomasa
# Tiene inputs que dependen de S (y de mu)
# y salidas que dependen de X (canal de salida)

function dX = f(x,t)
  Yxs = 2;  # 2gDW/mmol
  mux = 0.3;
  Km = 0.2;
  Sin = 1.5;  # mmol/L
  V = 0.5;  # L
  F = 0.05;  # L/h
  # x1 sera mu
  # x2 sera S
  # rs es x(1)/Yxs
  #x(1) = (mux*x(2)/(Km + x(2)));  # Mu
  #dX(2) = -(x(1)/Yxs)*x(3) + (F/V)*(Sin - x(2));  # Sustrato
  # x3 sera Biomasa
  #dX(3) = x(1)*x(3) - (F/V)*x(3);  # Biomasa
  dX = [
    -((mux*x(1)/(Km + x(1)))/Yxs)*x(2) + (F/V)*(Sin - x(1))
    (mux*x(1)/(Km + x(1)))*x(2) - (F/V)*x(2)
    ];
endfunction

Bo = 0.1;  # gDW/L biomasa
So = 1.5;  # mmol/L
Muo = (0.3)*(1.5/(1.5 + 0.2));

#co = [Muo; So; Bo]';
co = [So; Bo]';

t = [0:1:150]';  # Horas

c = lsode('f',co,t);

SustratoFinal = c(:,1)(15)
BiomasaFinal = c(:,2)(150)
Mu = ((c(:,1).*mux)./(Km + c(:,1)))';
MuFinal = Mu(150)

plot(t,c(:,1));
hold on
plot(t,c(:,2));
figure
plot(t,Mu);