# Intento nested monod
# http://stackoverflow.com/questions/20402725/solving-nonlinear-equations-in-octave
# http://stackoverflow.com/questions/37890794/fsolve-error-no-function-or-method-found
h = 'hola'
mux = 0.3;
Km = 0.2;
Yxs = 2;  # 2gDW/mmol

function dX = f(x,t)
  Yxs = 2;  # 2gDW/mmol
  mux = 0.3;
  Km = 0.2;
  Sin = 1.5;  # mmol/L
  V = 0.5;  # L
  F = 0.05;  # L/h
  mu = @(z) mux*z/(Km + z);
  dX(1) = -mu(x(1))*x(2)/Yxs + (F/V)*(Sin - x(1));
  dX(2) = mu(x(1))*x(2) - (F/V)*x(2);
endfunction

Bo = 0.1;  # gDW/L biomasa
So = 1.5;  # mmol/L
Muo = (0.3)*(1.5/(1.5 + 0.2));

#co = [Muo; So; Bo]';
co = [So; Bo]';

t = [0:1:150]';  # Horas

c = lsode(@f,co,t);

SustratoFinal = c(:,1)(15)
BiomasaFinal = c(:,2)(150)
Mu = ((c(:,1).*mux)./(Km + c(:,1)))';
MuFinal = Mu(150)

plot(t,c(:,1));
hold on
plot(t,c(:,2));
figure
plot(t,Mu);