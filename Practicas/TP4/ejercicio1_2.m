# Ejercicio 1
# Reactor Monod

colors = ['r';'g';'b';'k';'c';'m'];
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
  global Km
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

for i = 1:5
  global n;  n = i;
  global Yxs;  Yxs = yxs(n);  # 2gDW/mmol
  global mux;  mux = Mux(n);
  global Km;  Km = km(n);
  c = lsode('f',co,t);
  Mu = ((c(:,1).*mux)./(Km + c(:,1)))';
  figure 1
  hold on
  plot(t,Mu,colors(n));
  
  figure 2
  hold on
  plot(t,c(:,1),colors(n))
  
  figure 3
  hold on
  plot(t,c(:,2),colors(n))
endfor

figure 3
legend('X1','X2','X3','X4','X5')
figure 2
legend('S1','S2','S3','S4','S5')