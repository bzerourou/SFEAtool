function plotdeforme(u,p,t,s)
%
% plotdef(U,p,t,s) : plot d�formed shap  
% U : FE solution k . u = f    ( u = k \ f )
% p : table des coordon�es nodales
% t : table des connectivit�s des �l�ments
% s : scal factor

 
 plotmesh(t,p,0,0,'g');
 
 n = length(u);
 p = p + s * [u(1:2:n),u(2:2:n)];
 plotmesh(t,p,0,0,'r'); 
 axis equal;

return