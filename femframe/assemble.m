function M = assemble(M,m,t)
%
% M = assemble(M,m,t)
%
% M : matrice globale à assembler
% m : matrice élémentaire à ajouter à M
% t : table de localisation ou de connectivité

  M(t,t) = M(t,t) + m;

return