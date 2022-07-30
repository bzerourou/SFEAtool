function F = FrameLoads(t,p,q)
% F = FrameLoads(t,p,q)
% 
% F : Vecteur du chargement Force assembl� 
% t : table de connectivit�s des �l�ments
% p : table des coordon�es des noeuds
% q : table de chargement 
%      q(:,1) = num�ros des �l�ments charg�s
%      q(:,2) = valeur q1 du chargement
%      q(:,3) = valeur q2 du chargement
%
%  Voir aussi (See also) :    FRAMEK  FRAMEM

  net = size(t,1);     % nombre d'�lts total
  nec = size(q,1);     % nombre d'�lts charg�s 
  nnt = 3*size(p,1);   % nombre de DDL 
  
  F = sparse(nnt,1);
  for i = 1:nec
      ie = q(i,1); 
      q0 = q(i,2);
      q1 = q(i,3);
      
      Fe = FrameFe(p(t(ie,:),:),q0,q1);
      
      L = Loc(t(ie,:),3);        % Localisation 
      F(L) = F(L) + Fe;          % Assemblage
  end
return
