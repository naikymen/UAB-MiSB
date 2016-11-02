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
#Keq = k1/k2
#k2 = k1/Keq

K1 = [0.02, 0.2, 2, 10, 20];
K3 = [0.02, 0.2, 0.5, 1, 2];
Keq = [0.002, 0.02, 0.2, 1, 2];

function dX = f(x,t)
  global k1;
  global k3;
  global keq;
  
  dX(1) = -k1*x(1) +(k1/keq)*x(2);
  dX(2) =  k1*x(1) - k3*x(2) -(k1/keq)*x(2);
  dX(3) =  k3*x(2);
endfunction

colors = ['r';'g';'b';'k';'c';'m'];

# Figura 1 (k1)
for i = 1:5
  global n;  n = i;
  global k1; k1 = K1(n);
  global k3; k3 = K3(1);
  global keq; keq = Keq(1);
  
  c = lsode(@f,ci,t);
  A = c(:,1); B = c(:,2); C = c(:,3);
  dis = (B./(A.*Keq));
  
  figure 1
  subplot(2,2,1);
  hold on
  plot(t,A,colors(n));
  
  figure 1
  subplot(2,2,2);
  hold on
  plot(t,B,colors(n));
  
  figure 1
  subplot(2,2,3);
  hold on
  plot(t,C,colors(n));
  
  figure 1
  subplot(2,2,4);
  hold on
  plot(t,dis,colors(n));

endfor

# Figura 2 (k3)
for i = 1:5
  global n;  n = i;
  global k1; k1 = K1(1);
  global k3; k3 = K3(n);
  global keq; keq = Keq(1);
  
  c = lsode(@f,ci,t);
  A = c(:,1); B = c(:,2); C = c(:,3);
  dis = (B./(A.*Keq));
  
  figure 2
  subplot(2,2,1);
  hold on
  plot(t,A,colors(n));
  
  figure 2
  subplot(2,2,2);
  hold on
  plot(t,B,colors(n));
  
  figure 2
  subplot(2,2,3);
  hold on
  plot(t,C,colors(n));
  
  figure 2
  subplot(2,2,4);
  hold on
  plot(t,dis,colors(n));

endfor

# Figura 3 (Keq)
for i = 1:5
  global n;  n = i;
  global k1; k1 = K1(1);
  global k3; k3 = K3(1);
  global keq; keq = Keq(n);
  
  c = lsode(@f,ci,t);
  A = c(:,1); B = c(:,2); C = c(:,3);
  dis = (B./(A.*Keq));
  
  figure 3
  subplot(2,2,1);
  hold on
  plot(t,A,colors(n));
  
  figure 3
  subplot(2,2,2);
  hold on
  plot(t,B,colors(n));
  
  figure 3
  subplot(2,2,3);
  hold on
  plot(t,C,colors(n));
  
  figure 3
  subplot(2,2,4);
  hold on
  plot(t,dis,colors(n));

endfor


figure 1
subplot(2,2,1); legend('0.02', '0.2', '2', '10', '20'); title('Efecto de k1 sobre A');
subplot(2,2,2); legend('0.02', '0.2', '2', '10', '20'); title('Efecto de k1 sobre B');
subplot(2,2,3); legend('0.02', '0.2', '2', '10', '20'); title('Efecto de k1 sobre C');
subplot(2,2,4); legend('0.02', '0.2', '2', '10', '20'); title('Efecto de k1 sobre el Desequilibrio');

figure 2
subplot(2,2,1); legend('0.02', '0.2', '0.5', '1', '2'); title('Efecto de k3 sobre A');
subplot(2,2,2); legend('0.02', '0.2', '0.5', '1', '2'); title('Efecto de k3 sobre B');
subplot(2,2,3); legend('0.02', '0.2', '0.5', '1', '2'); title('Efecto de k3 sobre C');
subplot(2,2,4); legend('0.02', '0.2', '0.5', '1', '2'); title('Efecto de k3 sobre el Desequilibrio');

figure 3
subplot(2,2,1); legend('0.002', '0.02', '0.2', '1', '2'); title('Efecto de Keq sobre A');
subplot(2,2,2); legend('0.002', '0.02', '0.2', '1', '2'); title('Efecto de Keq sobre B');
subplot(2,2,3); legend('0.002', '0.02', '0.2', '1', '2'); title('Efecto de Keq sobre C');
subplot(2,2,4); legend('0.002', '0.02', '0.2', '1', '2'); title('Efecto de Keq sobre el Desequilibrio');