function M = JointMasses(m,ndof,nnt)
%
% M = JointMasses(m,ndof,nnt) 
% M : matrice masse assembl�e contenant les masses nodales
% m : masses nodales concentr�es 
%     m(:,1) = num�ro du noeud
%     m(:,2) = masse dans la direction x
%     m(:,3) = masse dans la direction y
%     m(:,4) = moment d'inertie la direction z
%
% ndof : nombre de degr�s de libert� par noeud
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
