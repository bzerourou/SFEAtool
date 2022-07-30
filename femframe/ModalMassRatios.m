function [mmr] = ModalMassRatios(M,Phi,Rx,Ry,Mtx,Mty)
% [mmr] = ModalMassRatio(M,Phi,Rx,Ry,Mt)
% mmr   : modal participating mass ratio
% alpha : modal participating coefficient
% M : Masse matrix 
% V : Eigen vetor(s) 
% Mt: total mass 
n = size(Phi,2);
for i = 1:n
    m1 = ModalMassRatio(M,Phi(:,i),Rx,Mtx);
    m2 = ModalMassRatio(M,Phi(:,i),Ry,Mty);
    mmr(i,:)=[m1,m2];
end
return;