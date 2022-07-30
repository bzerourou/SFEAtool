function [t,p,b,h,e,E,rho,f,m,q] = frame1 ;
%
% poutre console dévisée en deux éléments 
%
%  /          1                  
%  /(1)----------------------(2)
%  / 

t = [1  2              % connectivité de l'élément 1
    ];

p = [  0  , 0 ; ...          % coordonnées du noeud 1
       1.5, 0 ; ...          % coordonnées du noeud 2
    ];

e = [ 
      1, 2, 3             % noeud 1 bloqué sur Ux, Uy et Rx
    ]; 

b   = 0.3 ;       
h   = 0.4 ;       % les 2 elements ont la meme section A=b*h=5*5 cm²
E   = 3.2e10;     % le meme module d'alasticité E = 200 GPa
rho = 2500;     % et la meme masse volumique rho = 2500 kg/m3

f = [2 0 0 -60e3];

                             

m = [ 1 0 0 0 ];

q = [
     1  -60000 -60000 ; ...      % charge uniforme sur l'élément 1
    ];         
