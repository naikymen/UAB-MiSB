# Trabajo Grupal - In Silico Feedback
as = 0.0155;
am = 0.0300;
# bm
# rm
ap = 0.0066;
# bp
k = 0.0419;
bm_bar = 0.9587;

function dX = f(x,tt)
  as = 0.0155;
  am = 0.0300;
  ap = 0.0066;
  k = 0.0419;
  bm_bar = 0.9587;
  
  dX(1) = -as*x(1); # s
  dX(2) = -am*(x(2)-1) + bm_bar*x(1); # m
  dX(3) = (ap + k)*(x(2)-x(3)); # p
  dX(4) = ap*(x(3)-x(4)); # f
endfunction

X0 = [1,1,1,1];

tmax = 600; intsize = 0.01; t = [0:intsize:tmax]';
c = lsode(@f,X0,t);

plot(t, c(:,4),'r');
hold on;
plot(t, c(:,1),'g');
plot(t, c(:,2),'b');
plot(t, c(:,3),'k');
legend("s", "m" , "p", "f");

c(tmax/intsize,:)