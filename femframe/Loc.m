 function L = Loc(t,n)
 %-------------------------------------------------
 % L = Loc(t,n) 
 % t : table de connectivités de l'element  
 % L : table de loacalisation 
 % n : nombre de degrès de liberté par noeud   
 %
 %  A. Seghir, 24/08/04 modifié 23/10/04
 %--------------------------------------------------
 e = eye(n);
 L = kron(n*t,e(n,:));
 for i=1:n-1
     L = L + kron(n*t-i,e(n-i,:));
 end
return

 