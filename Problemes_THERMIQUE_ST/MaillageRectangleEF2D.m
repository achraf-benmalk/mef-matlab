%**************************************************************
% MaillageRectangleEF2D.m                                
%
%Cr�ation d'un maillage d'�l�ments trangulaires dans un
% domaine rectangulaire
%**************************************************************

function [Nx,Ny,Connect,nx,ny]=MaillageRectangleEF2D(L,H,nx,ny);

%1) Cr�ation du nuage de noeuds

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

%2) Cr�ation de la table de connectivit�

Connect=delaunay(Nx,Ny);
TraceTriangulation(Connect,Nx,Ny);


