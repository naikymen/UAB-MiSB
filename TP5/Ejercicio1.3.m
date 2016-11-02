# Ejercicio fzero
f = @(z) sqrt((5 + sin((z.^2))));
x = [10 10]';
n = 20;
tol = 1E-5;

[vx, it] = broyden(x, f, n, tol)