# Ejercicio fzero

#f = @(x) sin(0.1*(x**2));

function y = f(x)
  y = sin(0.1*(x.**2));  # Fue importante usar el exponencial element-wise (con puntito)
endfunction


x1 = [0:0.1:20]';
y1 = f(x1);  # Aca da igual usar f o @f, pero 'f' tira error
plot(x1,y1)

x0 = [5 10];
rta = fzero(@f,x0);  # Acá es importante usar @f o 'f' para llamar a la funcion
rta
hold on
plot(rta,f(rta))


#c = 0:0.1:20;

#plot(c,f(c))