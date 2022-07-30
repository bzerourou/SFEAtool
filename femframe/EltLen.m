function [ds,c,s] = EltLen(XY)
%
% [c,s] = Getcosine(XY)  
% Calcul cos et sin de la matrice de rotation pour un  
% element barre à deux noeuds (x1,y1) (x2,y2)
% c : cosinus de l'angle
% s : sinus de l'angle 
% XY: cordonnées des noeuds  XY = [x1,y1; x2,y2]
% 
% A.Seghir, 06/08/04

  dx = XY(2,1) - XY(1,1);
  dy = XY(2,2) - XY(1,2);

  ds = sqrt(dx^2 + dy^2);
  c = dx/ds;
  s = dy/ds;
return