# Ejercicio 1
# Reactor Monod

Mux = linspace(0.1,1,5);
km = linspace(0.1,2,5);
yxs = linspace(1,4,5);

Bo = 0.1;  # gDW/L biomasa
So = 1.5;  # mmol/L
Muo = (0.3)*(1.5/(1.5 + 0.2));
co = [So; Bo]';

t = [0:1:150]';  # Horas

global nic

function dX = f(x,t)
  Sin = 1.5;  # mmol/L
  V = 0.5;  # L
  F = 0.05;  # L/h
  nic
  mux = mux(i)
  Km = km(i)
  Yxs = yxs(i)
  # x1 sera mu
  # x2 sera S
  # rs es x(1)/Yxs
  #x(1) = (mux*x(2)/(Km + x(2)));  # Mu
  #dX(2) = -(x(1)/Yxs)*x(3) + (F/V)*(Sin - x(2));  # Sustrato
  # x3 sera Biomasa
  #dX(3) = x(1)*x(3) - (F/V)*x(3);  # Biomasa
  dX(1) = -((mux*x(1)/(Km + x(1)))/Yxs)*x(2) + (F/V)*(Sin - x(1))
  dX(2) = (mux*x(1)/(Km + x(1)))*x(2) - (F/V)*x(2)
endfunction

for ni = 1:5
  global nic = ni
  nic
  c = lsode('f',co,t);
  Mu = ((c(:,1).*mux)./(Km + c(:,1)))';
  
  SustratoFinal = c(:,1)(15)
  BiomasaFinal = c(:,2)(150)
  MuFinal = Mu(150)
  
  figure
  plot(t,c(:,1));
  hold on
  plot(t,c(:,2));
  figure
  plot(t,Mu);
endfor