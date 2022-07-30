function [U,P,R,T] = femframe(ffd) 
[t,p,b,h,e,E,rho,f,m,q] = feval(str2func(ffd));
plotmesh(t,p,1,1,'b'); axis equal;

nnt = size(p,1);
K = FrameK(t,p,b,h,E);
M = FrameM(t,p,b .* h ,rho);  % A = b .* h
F = FrameLoads(t,p,q);

F = F + JointLoads(f,nnt); 
M = M + JointMasses(m,3,nnt);

Mtx = sum(M*kron(ones(length(M)/3,1),[1 0 0]'));
Mty = sum(M*kron(ones(length(M)/3,1),[0 1 0]'));

K = Encastre(K,e);
M = Encastre(M,e);
F = Encastre(F,e);

U = K \ F; 
U = Addbase(U,e);        % Ajouter les DDL des noeuds encastré

% convention de rotations positives avec le sens des aiguilles d'une montre
%U = U .* kron(ones(length(U)/3,1),[1; 1; -1] ); 

N = FrameForces(t,p,b,h,E,U,q);

[T,Phi] = EigenModes(K,M,10);

Rx = encastre(kron(ones(nnt,1),[1;0;0]),e);
Ry = encastre(kron(ones(nnt,1),[0;1;0]),e);
mmr= ModalMassRatios(M,Phi,Rx,Ry,Mtx,Mty);
i = 1:nnt;
j =sort([3*i-2 3*i-1]);
plotdeforme(U(j),p,t,500)
