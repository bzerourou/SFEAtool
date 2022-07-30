function U = AddBase(U,b)
%
% U = K \ F : FE solution
% b : table des num�ros des noeuds encastr�s

b = sort(b);
n = length(b);

for i = 1:n
    U = AddToVect(U,b(i),0);
end
U = U';
return

