 function L = Localise(t)
 %
 % L = Localise(T)
 % T : table de connectivit�s de l'element  
 % L : table de loacalisation 
 %
 % A. Seghir, 08/08/04 

 %Pr�fetable d'utiliser
 %L = kron(2*t-1,[1,0])+kron(2*t,[0,1]);
   nne = length(t);
   for i= 1:nne
       L([2*i-1 2*i]) = [2*t(i)-1 2*t(i)];
   end
return

 