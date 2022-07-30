function [F,R] = TrussForces(t,p,A,E,U)
% Forces = TrusAxialForces(t,p,A,E,U)
% t : table de connectivit�s des �l�ments
% p : table des coordon�es des noeuds
% A : sections des �l�ments
% E : modules d'�lasticit� 
% U : solution en d�placelment
%
% A. Seghir, le 07/08/04 modifi� : 27/08/04

  net = size(t,1);
  nnt = size(p,1);
  R = zeros(2*nnt,1);
  for ie = 1:net
      L = localise(t(ie,:));
      ke = truss2dKe(p(t(ie,:),:),A(ie),E(ie));
      ue = U(L);
      fe = ke*ue;
      R(L) = R(L) + fe;
      [L,c,s] = EltLen(p(t(ie,:),:));
      F(ie,:) = -( c*fe(1) + s*fe(2) );
  end
return
