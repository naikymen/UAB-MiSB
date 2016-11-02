function [xv,it]=broyden(x,f,n,tol)
% broyden(x,f,n,tol)
% x valores iniciales de n variables
% tol precisión requerida
% f handle a la funcion

fr=zeros(n,1);
it=0; xv=x;
fr=feval(f,xv);
%Valor inicial de Br
Br=eye(n);
fr=feval(f,xv);

while norm(fr)>tol
   it=it+1;
   pr=-Br*fr;
   tau=1;
   xv1=xv+tau*pr;
   xv=xv1;
   oldfr=fr;
   fr=feval(f,xv);  
%Actualizamos la aproximación al Jacobiano usando la fórmula de Broyden
   y=fr-oldfr;
   oldBr=Br;
   oyp=oldBr*y-pr;
   pB=pr'*oldBr;
   M=oyp*pB;
   Br=oldBr-M./(pr'*oldBr*y);
end;
