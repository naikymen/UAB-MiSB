# Ejercicio 1
# Reactor Monod

colors = ['r';'g';'b';'k';'c';'m'];
#https://www.gnu.org/software/octave/doc/v4.0.3/Two_002dDimensional-Plots.html
Mux = linspace(0.1,1,5);
km = linspace(0.1,2,5);
yxs = linspace(1,4,5);

Bo = 0.1;  # gDW/L biomasa
So = 1.5;  # mmol/L
Muo = (0.3)*(1.5/(1.5 + 0.2));
co = [So; Bo]';

t = [0:1:60]';  # Horas

function dX = f(x,t)
  global Yxs
  global mux
  global Km #https://www.gnu.org/software/octave/doc/v4.0.3/Global-Variables.html
  Sin = 1.5;  # mmol/L
  V = 0.5;  # L
  F = 0.05;  # L/h
  # x1 sera S
  # x2 sera Biomasa
  dX = [
    -((mux*x(1)/(Km + x(1)))/Yxs)*x(2) + (F/V)*(Sin - x(1))
    (mux*x(1)/(Km + x(1)))*x(2) - (F/V)*x(2)
    ];
endfunction

for i = 1:5 #https://www.gnu.org/software/octave/doc/v4.0.1/The-for-Statement.html
  global n;  n = i;
  global Yxs;  Yxs = yxs(n);  # Varaible
  global mux;  mux = 0.25;
  global Km;  Km = 0.5;
  c = lsode('f',co,t);
  
  figure 1
  hold on
  plot(t,c(:,1),colors(n))
  plot(t,c(:,2),colors(n),'linestyle','--')
endfor
title('Variacion de Yxs')

for i = 1:5
  global n;  n = i;
  global Yxs;  Yxs = 2.75;  # 2gDW/mmol
  global mux;  mux = Mux(n);
  global Km;  Km = 0.5;
  c = lsode('f',co,t);
  
  figure 2
  hold on
  plot(t,c(:,1),colors(n))
  plot(t,c(:,2),colors(n),'linestyle','--')
endfor
title('Variacion de Mu')

for i = 1:5
  global n;  n = i;
  global Yxs;  Yxs = 2.75;  # 2gDW/mmol
  global mux;  mux = 0.25;
  global Km;  Km = km(n);
  c = lsode('f',co,t);
  
  figure 3
  hold on
  plot(t,c(:,1),colors(n))
  plot(t,c(:,2),colors(n),'linestyle','--') # X
endfor
title('Variacion de Km')

figure 1
legend('S1','X1','S2','X2','S3','X3','S4','X4','S5','X5')
figure 2
legend('S1','X1','S2','X2','S3','X3','S4','X4','S5','X5')
figure 3
legend('S1','X1','S2','X2','S3','X3','S4','X4','S5','X5')