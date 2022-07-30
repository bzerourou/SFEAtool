function M = JointMasses(m,ndof,nnt)
%
% M = JointMasses(m,ndof,nnt) 
% M : matrice masse assemblée contenant les masses nodales
% m : masses nodales concentrées 
%     m(:,1) = numéro du noeud
%     m(:,2) = masse dans la direction x
%     m(:,3) = masse dans la direction y
%     m(:,4) = moment d'inertie la direction z
%
% ndof : nombre de degrès de liberté par noeud
% nnt  : nombre de noeuds total
%
%
% Voir aussi (See also) : NODALFORCES

 nm = size(m,1);
 M  = sparse(ndof*nnt, ndof*nnt);
 for i=1:nm
     L = Loc(m(i,1),ndof);
     M(L,L) = M(L,L) + diag([m(i,2),m(i,3),m(i,4)]);
 end;
