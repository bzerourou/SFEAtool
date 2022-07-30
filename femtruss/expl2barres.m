function [t,p,e,A,E,rho,F] = expl2barres;
t = [3  1             % connectivit� de l'�l�ment 1
     2  3               % connectivit� de l'�l�ment 2
    ];

p = [  0.0  0.6         % coordonn�es du noeud 1
       1.6  0.6         % coordonn�es du noeud 2
       0.8  0.0         % coordonn�es du noeud 3
    ];

e = [1; 2
     3; 4 ];    % noeuds d'encastrement  1 et 2;

A = [1 1] * 25e-4;      % sections des �l�ments
E = [1 1] * 210e9;      % module d'�lasticit� des �l�ments 
rho=[1 1] * 7.8e3;      % masse volumique 

F = [ 0;  0             % noeud 1
      0;  0             % noeud 2
      0; -3.4e6         % noeud 3
    ];
