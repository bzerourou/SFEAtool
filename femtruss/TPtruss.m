function [t,p,e,A,E,rho,F] = TPtruss;
t = [1  3           % barre  N°1
     2  3           % barre  N°2   
     2  4           % barre  N°3
     3  4           % barre  N°4
     3  5           % barre  N°5
     4  5           % barre  N°6
     4  6           % barre  N°7
     5  6           % barre  N°8
     5  7           % barre  N°9
     6  7           % barre  N°10
     6  8           % barre  N°11
     7  8           % barre  N°12
    ];

p = [  0.0  0.0     % noeud N°1
       0.0  0.5     % noeud N°2
       1.0  1.0     % noeud N°3
       1.0  1.5     % noeud N°4
       2.0  1.0     % noeud N°5
       2.0  1.5     % noeud N°6
       3.0  1.0     % noeud N°7
       3.0  1.5     % noeud N°8
    ];

e = [1; 2
     3; 4 ];    % noeuds d'encastrement  1 et 2;

A = ones(12,1) * 0.0036;    % sections des éléments
E = ones(12,1) * 2.1e11;    % module d'élasticité des éléments 
rho=ones(12,1) * 7.8e3;     % masse volumique 

F = [ 0;     0              % noeud 1
      0;     0              % noeud 2
      0;     0              % noeud 3
      10e3; -15e3           % noeud 4
      0;     0              % noeud 5
      0;    -15e3           % noeud 6
      0;     0              % noeud 7
      0;    -15.0e3         % noeud 8
    ];
