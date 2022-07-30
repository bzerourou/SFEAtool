function FF = FrameForces(t,p,b,h,E,U,q)
%
% FF = FrameFoForces(t,p,b,h,E,U)
% 
% t : table de connectivités des éléments
% p : table des coordonées des noeuds

  net = size(t,1);
  nnt = 2*size(p,1);
  
  for ie = 1:net
      ke = FrameKe(p(t(ie,:),:),b(ie),h(ie),E(ie));
      ue = U(Loc(t(ie,:),3));
      fe = ke*ue;
      [L,c,s] = EltLen(p(t(ie,:),:));
      FF(ie,1) = -c * fe(1) - s * fe(2); % précédées d'un signe moins
      FF(ie,2) =  s * fe(1) - c * fe(2);
      FF(ie,3) = -fe(3);
      FF(ie,4) =  c * fe(4) + s * fe(5);  
      FF(ie,5) = -s * fe(4) + c * fe(5);
      FF(ie,6) = fe(6);
  end
  nec = size(q,1);     % nombre d'élts chargés avec une charge répartie
  for ic = 1:nec
      ie = q(ic,1); 
      xy = p(t(ie,:),:);
      q0 = q(ic,2);
      q1 = q(ic,3);
      fe = FrameFe(xy,q0,q1)';
      FF(ie,[1:3]) = FF(ie,[1:3]) + fe([1:3]);
      FF(ie,[4:6]) = FF(ie,[4:6]) - fe([4:6]);
      %Mmitravee = FF(ie,3) - FF(ie,2)*L/2.0 + q0*L^2/12.0 + q1*L^2/24.0
      x = L/4  ; M(ie,1) = FF(ie,3) - FF(ie,2)*x + 0.5*q0*x^2 + (q1-q0)*x^3/(6*L);
      x = 3*L/4; M(ie,2) = FF(ie,3) - FF(ie,2)*x + 0.5*q0*x^2 + (q1-q0)*x^3/(6*L);
      x = 3*L/4; M(ie,2) = FF(ie,3) - FF(ie,2)*x + 0.5*q0*x^2 + (q1-q0)*x^3/(6*L);
      x = L    ; M(ie,3) = FF(ie,3) - FF(ie,2)*x + 0.5*q0*x^2 + (q1-q0)*x^3/(6*L);
      disp(sprintf('%5.2f\t',M(ie,:)))
  end;

return
