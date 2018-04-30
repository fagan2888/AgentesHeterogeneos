function [f]=bellman(l,i,x)
%*---------------------------------------------------------------------*
%bellman(x,i,l)
%Funci�n que calcula el lado derecho de la ecuaci�n de Bellman para cada x
%inputs:
%x: valor del activo el per�odo siguiente
%i: posici�n en el grid original del activo en el per�odo actual
%l: estado de la naturaleza actual
%Output
%f: Valor del lado derecho de la ecuaci�n de Bellman
%*---------------------------------------------------------------------*

global THETA Q GRID SIGMA ALFA BETA value_good value_bad w r
%**************************************************************
c=THETA(l)*w+((1+r)*GRID(i))-x;
if c<=0
   U=-10000;
else
   U=1/(1-SIGMA)*(c^(1-SIGMA));
end
v1=value_good;
v2=value_bad;
V1=interp1(GRID,v1,x);
V2=interp1(GRID,v2,x);
f=U+(BETA*(Q(1,1)*V1+Q(1,2)*V2));
