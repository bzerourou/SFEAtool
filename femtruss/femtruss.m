function [U,P,R,T]= femtruss(ffd)
% [U,P,T,phi] = trussfem(ffd)
% résolution des systèmes d'assemblage de barres bidimensionnels 
% U   : solution en déplacements nodaux 
% P   : forces axailes dans les barres 
% T   : périodes propres de la structure
% phi : modes propres de la structure
% ffd : fichier fonction de données du problème
%
% A. Seghir, le 06/08/04 modifié le 27/10/04
clc
[t,p,e,A,E,rho,F] = feval(str2func(ffd));
plotmesh(t,p,1,1,'b');

[K,M] = truss2dKM(t,p,A,E,rho);
K = DelDOFs(K,e);
M = DelDOFs(M,e);
F = DelDOFs(F,e);

U = K \ F; 
U = AddDOFs(U,e);       % Ajouter les DDL des noeuds encastré
[P,R] = TrussForces(t,p,A,E,U);
%R = R(e);
net = size(t,1);
nnt = size(p,1);

[T,Phi] = EigenModes(K,M,10)
% impression des résulatats
disp(' Résultats de calcul de la structure d''assemblage de barres')
disp([' fichier de données : ',ffd])
disp([' Nombre de barres : ',num2str(net)])
disp([' Nombre de noeuds : ',num2str(nnt)])

disp(sprintf('\n Déplacements aux noeuds :'))
disp(sprintf(' Noeud\t\t Ux\t\t\t\t Uy '))
for i=1:nnt
    disp(sprintf(' %d\t\t\t%+5.5f\t\t\t%+5.5f',i,U(localise(i))))
end

disp(sprintf('\n Efforts dans les barres :'))
disp(sprintf(' Barre \t\t P'))
for i=1:net
    disp(sprintf(' %d\t\t\t%+1.5f',i,P(i)))
end

disp(sprintf('\n Réactions aux appuis :'))
disp(sprintf(' Appuis\t\t Rx\t\t\t\t\t Ry '))
for i=1:nnt
    L = localise(i);
    %if find(e==L(1)) 
       disp(sprintf(' %d\t\t\t%+1.5f\t\t%+1.5f',i,R(L)))
       %end
end

disp(sprintf('\n Périodes propres de la strucutre :'))
disp(sprintf(' mode\t\tT'))
for i=1:size(T)
    disp(sprintf(' %d\t\t\t%5.7f',i,T(i)))
end
plotdeforme(U,p,t,10)