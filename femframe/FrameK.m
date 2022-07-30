function K = FrameK(t,p,b,h,E)
% K = FrameK(t,p,A,E)
% 
% K : matrice de rigidité assemblée 
% t : table de connectivités des éléments
% p : table des coordonées des noeuds
% D : matrice d'élasticité
% 
% Voir aussi (See also) : FRAMEKE   FRAMEM  FRAMEF

  net = size(t,1);
  nnt = 3*size(p,1);
  
  K = sparse(nnt,nnt);
  for ie = 1:net
      ke = FrameKe(p(t(ie,:),:),b(ie),h(ie),E(ie));
      K  = Assemble(K,ke,Loc(t(ie,:),3));
  end
return
