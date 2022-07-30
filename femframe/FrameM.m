function M = FrameM(t,p,A,rho)
% M = FrameM(t,p,A,E)
% 
% M : matrice Masse assemblée 
% t : table de connectivités des éléments
% p : table des coordonées des noeuds
% A : sections des éléments en vecteur
% 
% Voir aussi (See also) : FRAMEME   FRAMEK  FRAMEF

  net = size(t,1);
  nnt = 3*size(p,1);
  
  M = sparse(nnt,nnt);
  for ie = 1:net
      Me = FrameMe(p(t(ie,:),:),A(ie),rho(ie));
      M  = Assemble(M,Me,Loc(t(ie,:),3));
  end
return
