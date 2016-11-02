# https://www.gnu.org/software/octave/doc/v4.0.1/Three_002dDimensional-Plots.html

Xa = [-7.69 -15.61 90.4]';
Xb = [-7.69 -15.61 90.5]';
t = [0:0.005:8]';

function dX = f(x,t)
  r = 126.62;
  #r = 1
  dX(1) = 10*(x(2) - x(1));
  dX(2) = r*x(1) -x(2) - x(1)*x(3);
  dX(3) = x(1)*x(2) - (8/3)*x(3);
endfunction

function rX = g(x,t)
  #r = 126.62;
  r = 1;
  rX(1) = 10*(x(2) - x(1));
  rX(2) = r*x(1) -x(2) - x(1)*x(3);
  rX(3) = x(1)*x(2) - (8/3)*x(3);
endfunction

c = lsode("f",Xa,t);
d = lsode("f",Xb,t);
e = lsode("g",Xa,t);

xa = c(:,1); ya = c(:,2); za = c(:,3);
xd = d(:,1); yd = d(:,2); zd = d(:,3);
xe = e(:,1); ye = e(:,2); ze = e(:,3);

hold off
plot3(xa,ya,za,'color','r')
hold on
plot3(xa(1600),ya(1600),za(1600),'*','color','m');
plot3(xd,yd,zd,'color','k')
plot3(xd(1600),yd(1600),zd(1600),'*','color','b');
plot3(xe,ye,ze,'color','b')
plot3(xe(1600),ye(1600),ze(1600),'*','color','r');

# Repasar funcion 'subplot'
#http://stackoverflow.com/questions/17373723/how-to-change-plot3-colors-in-octave
#http://octave.sourceforge.net/octave/function/plot3.html



