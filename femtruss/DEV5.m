function [t,p,e,A,E,rho,F] = dev5;
t = [1  2             % connectivité de l'élément 1
     1  3               % connectivité de l'élément 2
     2  3               % connectivité de l'élément 2
    ];

p = [  0.0  0.0         % coordonnées du noeud 1
       5.0  0.0         % coordonnées du noeud 2
       3.0  1.5         % coordonnées du noeud 3
    ];

 e = [ 
       [0 1 ] .* localise(1)
       [1 1 ] .* localise(2)
     ];
     
A = [25 49 49]*1e-4 ;     % sections des éléments
E = [1 1 1] * 210e9;      % module d'élasticité des éléments 
rho=[1 1 1] * 7.8e3;      % masse volumique 

F = [ 0;  0             % noeud 1
      0;  0             % noeud 2
      0; -950e3         % noeud 3
    ];
