function ke = FrameKe(XY,b,h,E)
%
% ke = FrameKe(XY,A,E)
% Calcul de la matrice elementaire pour un  
% element frame à deux noeuds (x1,y1) (x2,y2)
% A : section de l'element
% E : module d'élasticité 
% XY: cordonnées des noeuds  XY = [x1,y1; x2,y2]
%
%  Voir aussi (See also) :    FRAMEK  FRAMEFE  FRAMEME

  [L,c,s] = EltLen(XY);   
  
  cc = c*c;
  ss = s*s;
  cs = c*s;
  A = b*h;
  I = (b * h^3) / 12;
  
  EI  = E*I;
  AE  = A*E;
  
  a1 =  (EI/L) * 4;
  a2 =  (EI/L) * 2;
  a3 =  (AE/L) * cc + (12*EI/L^3) * ss;
  a4 =  (AE/L) * cs - (12*EI/L^3) * cs;
  a5 = -(6*EI/L^2) * s;
  a6 =  (AE/L) * ss + (12*EI/L^3) * cc;
  a7 =  (6*EI/L^2) * c;
  
  ke = [  
         a3   a4   a5  -a3  -a4   a5 ; ... 
         a4   a6   a7  -a4  -a6   a7 ; ... 
         a5   a7   a1  -a5  -a7   a2 ; ... 
        -a3  -a4  -a5   a3   a4  -a5 ; ... 
        -a4  -a6  -a7   a4   a6  -a7 ; ... 
         a5   a7   a2  -a5  -a7   a1 ; ... 
     ];
 
return