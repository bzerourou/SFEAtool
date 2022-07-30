function M = encastre(M,T)
%
% M = CAL(M,T)
%
% M : matrice globale après assemblage
% T : table de localisation des noeuds frontières
% A. Seghir, le 01/08:04 modifié le 08/08/04

T = sort(T);
n = length(T);

if (size(M,2) == 1)
    for i = n:-1:1
        M(T(i)) =[] ;
    end
else
    for i = n:-1:1
        M(T(i),:) =[] ;
    end
    for i = n:-1:1
        M(:,T(i)) =[] ;
    end
end

return