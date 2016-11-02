# Ejercicio fzero

#f = @(x) sin(0.1*(x**2));

function z = f(x)
  y = @(k) sin(0.1*(k.**2));  # Fue importante usar el exponencial element-wise (con puntito)
  x = sqrt(y(x).*5 + 25);
endfunction

x0 = [0 100];
rta = fzero(@f,x0);  # Acá es importante usar @f o 'f' para llamar a la funcion
rta
hold on
plot(rta,f(rta))


#c = 0:0.1:20;

#plot(c,f(c))