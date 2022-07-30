function Fe = FrameFe(XY,q0,q1)
%
% Fe = FrameFe(XY,q0,q1)
% Calcul du vecteur force repartie linéairement de q0 à q1 sur un   
% element frame à deux noeuds (x1,y1) (x2,y2)
% XY: cordonnées des noeuds  XY = [x1,y1; x2,y2]
%
%  Voir aussi (See also) :    FRAMELOADS  FRAMEKE  FRAMEME


 L = EltLen(XY);  
 
 Fe = [ 0.0                         
        L   * ( 0.15*q1 + 0.35*q0 ) 
        L^2 * ( 1/30*q1 + 0.05*q0 ) 
        0.0                         
        L   * ( 0.35*q1 + 0.15*q0 ) 
       -L^2 * ( 0.05*q1 + 1/30*q0 ) 
   ];


return