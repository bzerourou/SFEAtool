function M = assemble(M,m,t)
%
% M = assemble(M,m,t)
%
% M : matrice globale � assembler
% m : matrice �l�mentaire � ajouter � M
% t : table de localisation ou de connectivit�

  M(t,t) = M(t,t) + m;

return