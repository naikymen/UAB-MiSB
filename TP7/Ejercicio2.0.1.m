#Practica 6 - Ejercicio 2
# Con multiplicacion de matrices

A0 = 1;
B0 = 0;
C0 = 0;
D0 = 0;
X0 = [A0,B0,C0,D0];
t = [0:0.01:1];

function dX = f(x,t)
  km = 0.1;
  Vm1 = 10;
  Vm2 = 5;
  Vm3 = 2.5;
  
  v = @(s,vmax) vmax*s/(s+km);
  
  S = [
    -1  0  0;
     1 -1 -1;
     0  1  0;
     0  0  1 ];
  
  
  V = [
    v(x(1),Vm1);
    v(x(2),Vm2);
    v(x(2),Vm3) ];
  
  dX = S*V;
endfunction

c = lsode(@f,X0, t);
A = c(:,1); B = c(:,2); C = c(:,3); D = c(:,4);

figure 2
plot(t, A,'color','r','linewidth',1);hold on;
plot(t, B,'color','g','linewidth',2);
plot(t, C,'color','b','linewidth',1);
plot(t, D,'color','k','linewidth',1);
plot(1,C(100),'color','b','*','linewidth',4);
plot(1,D(100),'color','k','*','linewidth',4);

plot(t, 1-(A+C+D),'color','k', 'linestyle','--');
plot(t, C./D,'color','k', 'linestyle','-','linewidth',2);
legend('A','B','C','D','C final','D final','1-(A+C+D)','C/D');
hold off

# al final, las concentraciones son constantes y las velocidades nulas porque el sistema avanza irreversiblemente hacia los productos
# las concentraciones finales en estas reacciones irreversibles quedan definidas por las velocidades de cada reaccion
# en el grafico vemos que la relacion C/D=2 y V2/V3=2