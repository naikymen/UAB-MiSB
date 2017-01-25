# Ejercicio fzero
f = @(x) sqrt(25 + 5*sin(0.1*x.^2));

x0 = [-4 4]';
r = fsolve(g,x0);  # fzero solo funciona para lineales, no puedo usarlo con terminos al cuadrado
# Si la funcion es ANOINIMA, NO HAY QUE USAR usar @f o 'f' para llamar a la funcion

x1 = [-10:0.1:10];
plot(x1,g(x1));
hold on
plot(r(1),g(r(1)));

for r = rta
  plot(r,g(r),'marker','.','color','w');
endfor

hold off;