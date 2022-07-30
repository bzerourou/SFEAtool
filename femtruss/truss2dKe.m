function ke = truss2DKe(XY,A,E)
% ke = truss2dKe(XY,A,E)
% Calcul de la matrice elementaire pour un  
% element barre à deux noeuds (x1,y1) (x2,y2)
% A : section de l'element
% E : module d'élasticité 
% XY: cordonnées des noeuds  XY = [x1,y1; x2,y2]
% A. Seghir, 06/08/04

  [L,c,s] = EltLen(XY);  
  cc = c*c;
  cs = c*s;
  ss = s*s;
  ke = (A*E/L) * [  cc  cs -cc -cs
                    cs  ss -cs -ss
                   -cc -cs  cc  cs
                   -cs -ss  cs  ss
                 ];
return