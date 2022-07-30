function F = NodalLoads(f,nnt)
% F = NodalLoads(t,p,f)
% 
% F : Vecteur du chargement Forces nodales 
% t : table de connectivités des éléments
% p : table des coordonées des noeuds
% f : table de chargement 
%      q(:,1) = numéros des noeuds chargés
%      q(:,2) = valeur fx du chargement
%      q(:,3) = valeur fy du chargement
%
%  Voir aussi (See also) :    NODALMASSES     
%                             FRAMEFE  FRAMEK  FRAMEM


  nnc = size(f,1);                    % nombre de noeuds chargés 
  F = sparse(3*nnt,1);
  for i = 1:nnc
      nc   = f(i,1);
      L    = Loc(nc,3);                % Localisation 
      F(L) = [f(i,2) f(i,3) f(i,4)];   % Affectation
  end
return
