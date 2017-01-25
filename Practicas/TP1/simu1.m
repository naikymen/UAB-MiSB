#Simulacioncita
function simu1
  V0 = 1200
  temps = [0 700]
  #el arroba para que es?
  [t, V] = ode45(@fder,temps,V0)
  #ode45 es la funcion que resuelve ecuaciones diferenciales ordenarias
  #la ecuacion a resolver se especifica entre parentesis (fder)
  #luego se especifica el rango de valores de la variable dependiente entre los que resolver la ecuacion (temps)
  #finalmente se esepcifica la condicion inical de la variable independiente (V0)
  
  function dV=fder(tt,vv)
    Qe = 6
    Qs = 8
    dV=Qe-Qs
  end
end # asi seria en matlab