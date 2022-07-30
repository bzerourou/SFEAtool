function [mmr,alpha] = ModalMassRatio(M,V,R,Mt)
% [mmr,alpha] = ModalMassRatio(M,V,R,Mt)
% mmr   : modal participating mass ratio
% alpha : modal participating coefficient
% M : Mass matrix 
% V : Eigen vetor
% R : dynamic coupling vector (ddl)
% Mt: total mass 

 r = V' * M * R;
 m = V' * M * V;
 if m <=1e-10
     alpha = 0;
 else
     alpha = r / m ;
 end;
 mmr = 100 * alpha^2 * m / Mt; 

return
