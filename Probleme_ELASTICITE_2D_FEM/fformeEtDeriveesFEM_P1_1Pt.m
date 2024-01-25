%**************************************************************
% fformeEtDeriveesFEM_P1_1Pt.m                                
%
%Calcule les fonctions de forme P1 (linéaires) et les
%dérivées dans un élément triangulaire
%**************************************************************


function [fforme,deriveesX,deriveesY,Voisins]...
    =fformeEtDeriveesFEM_P1_1Pt(X,Y,tri,Connect,Nx,Ny)


n1=Connect(tri,1);
n2=Connect(tri,2);
n3=Connect(tri,3);


x1=Nx(n1);
y1=Ny(n1);
x2=Nx(n2);
y2=Ny(n2);
x3=Nx(n3);
y3=Ny(n3);


[pX]=p_1_x_y(X,Y);
[DpX]=DXp_1_x_y(X,Y);
[DpY]=DYp_1_x_y(X,Y);

A=[1 x1 y1
    1 x2 y2
    1 x3 y3 ];

b=[ 1 0 0
    0 1 0
    0 0 1];

for iN=1:3

    bN=b(iN,:)';
    fforme(iN)=pX*inv(A)*bN;
    deriveesX(iN)=DpX*inv(A)*bN;
    deriveesY(iN)=DpY*inv(A)*bN;

end

Voisins=[n1 n2 n3];


