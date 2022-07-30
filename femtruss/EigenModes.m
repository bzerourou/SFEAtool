  function [T,Phi] = EigenModes(K,M,nmodes)
  % [T,Phi] = EigenModes(K,M,nmodes)
  % T      : periodes propres 
  % Phi    : modes propes
  % nmodes : nombre de modes
  
  
  
  
  warning off MATLAB:eigs:TooManyRequestedEigsForRealSym
  opts.disp   = 0;
  opts.issym  = 1;
  opts.isreal = 1;
  opts.tol    = 1e-20; 
  
  [n,n] = size(M);
  nmodes = min([nmodes,n]);

  [Phi ,Omega] = eigs(M,K,nmodes,'LM',opts);
  T = 2*pi*diag(Omega) .^ 0.5;
 
  i = find(T<1e-8);
  T(i) = [];
  Phi(:,i) =[];
  
  
return