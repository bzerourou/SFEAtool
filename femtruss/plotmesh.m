function plotmesh(T,P, NodeLabels, EltLabels,color)
%---------------------------------------------------
% plotmesh(T, P, NodeLabels, EltLabels)
% 
%  T = fem.mesh.t 
%  P = fem.mesh.p
% A. Seghir, 02/08/04 modifié 07/08/04 
%--------------------------------------------------

Net = size(T,1);

for ie = 1:Net
    XY = P(T(ie,:),:);
    X = [[XY(:,1)]; XY(1,1)];
    Y = [[XY(:,2)]; XY(1,2)];
    line(X,Y,'color',color)
    
    if(EltLabels)
        x =  mean(XY(:,1));
        y =  mean(XY(:,2));
        text(x,y,num2str(ie),'color','b')
    end
end 

if(NodeLabels)
    Np = size(P,1);
    for i=1:Np
        text(P(i,1),P(i,2),num2str(i),'color','m')
    end
end
