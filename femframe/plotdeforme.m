function plotdeforme(u,p,t,s)
%
% plotdef(U,p,t,s) : plot déformed shap  
% U : FE solution k . u = f    ( u = k \ f )
% p : table des coordonées nodales
% t : table des connectivités des éléments
% s : scal factor

 
 plotmesh(t,p,0,0,'g');
 
 n = length(u);
 p = p + s * [u(1:2:n),u(2:2:n)];
 plotmesh(t,p,0,0,'r'); 
 axis equal;

return