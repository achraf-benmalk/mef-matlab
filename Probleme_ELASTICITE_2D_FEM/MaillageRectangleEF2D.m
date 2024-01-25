%**************************************************************
% MaillageRectangleEF2D.m                                
%
%Création d'un maillage d'éléments trangulaires dans un
% domaine rectangulaire
%**************************************************************

function [Nx,Ny,Connect,nx,ny]=MaillageRectangleEF2D(L,H,nx,ny);

%1) Création du nuage de noeuds

l=L/(nx-1);
h=H/(ny-1);

k=0;
for i=1:nx
   for j=1:ny
      k=k+1;
      Nx(k)=(i-1)*l;
      Ny(k)=(j-1)*h;
   end
end

%2) Création de la table de connectivité

Connect=delaunay(Nx,Ny);
TraceTriangulation(Connect,Nx,Ny);


