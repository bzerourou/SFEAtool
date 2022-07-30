function [t,p,b,h,e,E,rho,f,m,q] = frame3 ;
%
% poutre sur deux appuis simple chargée au mulieu 
%
%                  |
%              Fy = 1500 N
%                  |              Fx = 500N
%                  V             --->
%   (4)-----4-----(5)-----5-----(6)         y = 3m
%    |            /|            /|
%    |          /  |          /  |
%    |        /    |        /    |
%    3      8      7      9      6
%    |    /        |    /        |
%    |  /          |  /          |
%    |/            |/            |
%   (1)-----1-----(2)-----2-----(3)         y = 0m
% appuis                       appuis    
% simple                       simple
%
%  x = 0         x = 2m        x = 4m
%

t = [1  2 ; ...              % connectivité de l'élément 1
     2  3 ; ...              % connectivité de l'élément 2
     1  4 ; ...              % connectivité de l'élément 3
     4  5 ; ...              % connectivité de l'élément 4
     5  6 ; ...              % connectivité de l'élément 5
     6  3 ; ...              % connectivité de l'élément 6
     5  2 ; ...              % connectivité de l'élément 7
     5  1 ; ...              % connectivité de l'élément 8
     2  6 ; ...              % connectivité de l'élément 9
    ];

p = [  0  , 0 ; ...          % coordonnées du noeud 1
       2  , 0 ; ...          % coordonnées du noeud 2
       4  , 0 ; ...          % coordonnées du noeud 3
       0  , 3 ; ...          % coordonnées du noeud 4
       2  , 3 ; ...          % coordonnées du noeud 5
       4  , 3 ; ...          % coordonnées du noeud 6
    ];

e = [ 
      1, 2,  ...           % noeud 1 bloqué sur Ux et Uy 
      7, 8,  ...           % noeud 3 bloqué sur Ux et Uy    
    ]; 

net = size(t,1);
b   = 0.05  * ones(1,net);     % les 7 elements ont la meme section 
h   = 0.05  * ones(1,net);     % A = b * h = 5 * 5  cm²
E   = 200E9 * ones(1,net);     % le meme module d'alasticité E = 200 GPa
rho = 2500  * ones(1,net);     % et la meme masse volumique rho = 2500 kg/m3

                              %forces nodales 
f  = [ 5   0   -1500 0 ;      % noeud 5 : Fx = 0KN, Fy = 0KN et M =0KNm
       6  5000  0    0 ;      % noeud 6 : Fx = 5KN, Fy = 0KN et M =0KNm  
       4  5000  0    0 ;      % noeud 4 : Fx = 5KN, Fy = 0KN et M =0KNm  
     ];

m =[5 40000 0 0];

q =[5 -3000  -3000           % charge uniforme de 3KN  sur l'élément 5
    4 -10000 -10000 ];       % charge uniforme de 10KN sur l'élément 4
%q=[];