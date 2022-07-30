function [K,M] = truss2dM(t,p,A,E,rho)
% [K,M] = truss2dKM(t,p,A, rho)
% 
% K  : matrice de rigidit� assembl�e 
% M  : matrice masse assembl�e 
% t  : table de connectivit�s des �l�ments
% p  : table des coordon�es des noeuds
% A  : sections des �l�ments (des barres)
% E  : modules d'�lasticit� en vecteur des �l�ments 
% rho: masse volumique
%
%A. Seghir, le 07/08/04, modifi� : 26/10/04

  net = size(t,1);
  nnt = 2*size(p,1);
  
  K = sparse(nnt,nnt);
  M = sparse(nnt,nnt);
  for i = 1:net
      ti = t(i,:);
      Li = localise(ti);
      Ke = truss2dKe(p(ti,:),A(i),E(i));
      Me = truss2dMe(p(ti,:),A(i),rho(i));
      K(Li,Li) = K(Li,Li) + Ke;
      M(Li,Li) = M(Li,Li) + Me;
  end
return