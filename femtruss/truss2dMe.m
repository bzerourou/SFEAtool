function Me = truss2dMe(XY,A,rho)
% Me = truss2dMe(XY,A,rho)
%      Calcul de la matrice masse elementaire Me pour un  
%      �l�ment barre � deux noeuds (x1,y1) (x2,y2)
% A   : section de l'�l�ment
% rho : masse volumique de l'�l�ment 
% XY  : cordonn�es des noeuds  XY = [x1,y1; x2,y2]
%
% A. Seghir, 07/08/04

  L = EltLen(XY);
  Me = 0.5*rho*A*L *eye(4);
  
  % pour la masse repartie : 
  %Me =(rho*A*L/6) * [ 2  0  1  0 ; ...
  %                    0  2  0  1 ; ...
  %                    1  0  2  0 ; ...
  %                    0  1  0  2 ; ...
  %                ];
  
return