function A = DelDOFs(A,L)
% A = DelDOFs(A,L)
%
% A : matrice globale apr�s assemblage
% L : table de localisation des noeuds d'appuis (les DDL � elever)
%
% A. Seghir, le 01/08/04 modifi� le 08/08/04
[m,n] = size(L);
L = reshape(L,m*n,1);
L = L(find(L));
L = sort(L);

n = length(L);

if (size(A,2) == 1)
    for i = n:-1:1
        A(L(i)) =[] ;
    end
else
    for i = n:-1:1
        A(L(i),:) =[] ;
        A(:,L(i)) =[] ;
    end
end
return