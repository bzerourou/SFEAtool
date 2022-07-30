function [t,p,b,h,e,E,rho,f,m,q] = frame3 ;
%
% poutre sur deux appuis simple charg�e au mulieu 
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

t = [1  2 ; ...              % connectivit� de l'�l�ment 1
     2  3 ; ...              % connectivit� de l'�l�ment 2
     1  4 ; ...              % connectivit� de l'�l�ment 3
     4  5 ; ...              % connectivit� de l'�l�ment 4
     5  6 ; ...              % connectivit� de l'�l�ment 5
     6  3 ; ...              % connectivit� de l'�l�ment 6
     5  2 ; ...              % connectivit� de l'�l�ment 7
     5  1 ; ...              % connectivit� de l'�l�ment 8
     2  6 ; ...              % connectivit� de l'�l�ment 9
    ];

p = [  0  , 0 ; ...          % coordonn�es du noeud 1
       2  , 0 ; ...          % coordonn�es du noeud 2
       4  , 0 ; ...          % coordonn�es du noeud 3
       0  , 3 ; ...          % coordonn�es du noeud 4
       2  , 3 ; ...          % coordonn�es du noeud 5
       4  , 3 ; ...          % coordonn�es du noeud 6
    ];

e = [ 
      1, 2,  ...           % noeud 1 bloqu� sur Ux et Uy 
      7, 8,  ...           % noeud 3 bloqu� sur Ux et Uy    
    ]; 

net = size(t,1);
b   = 0.05  * ones(1,net);     % les 7 elements ont la meme section 
h   = 0.05  * ones(1,net);     % A = b * h = 5 * 5  cm�
E   = 200E9 * ones(1,net);     % le meme module d'alasticit� E = 200 GPa
rho = 2500  * ones(1,net);     % et la meme masse volumique rho = 2500 kg/m3

                              %forces nodales 
f  = [ 5   0   -1500 0 ;      % noeud 5 : Fx = 0KN, Fy = 0KN et M =0KNm
       6  5000  0    0 ;      % noeud 6 : Fx = 5KN, Fy = 0KN et M =0KNm  
       4  5000  0    0 ;      % noeud 4 : Fx = 5KN, Fy = 0KN et M =0KNm  
     ];

m =[5 40000 0 0];

q =[5 -3000  -3000           % charge uniforme de 3KN  sur l'�l�ment 5
    4 -10000 -10000 ];       % charge uniforme de 10KN sur l'�l�ment 4
%q=[];