%**************************************************************
% DessineValeurs.m                                
%
%Crée un dégradé de couleurs dans les éléments triangulaires
%pour représenter un champ scalaire
%**************************************************************

function []=DessineValeurs(VecteurValeurs,Nx,Ny,Connect)

hold on

for i=1:size(Connect,1)
   if Connect(i,1)~=0
       
      %1)Trouver les 3 noeuds
      n1=Connect(i,1);
      n2=Connect(i,2);
      n3=Connect(i,3);
      
      %2)Construire X, Y, C       
      
      X(1,1)=Nx( n1 );
      X(2,1)=Nx( n2 );
      X(3,1)=Nx( n3 );
      
      Y(1,1)=Ny( n1 );
      Y(2,1)=Ny( n2 );
      Y(3,1)=Ny( n3 );  
      
      C(1,1)=VecteurValeurs(n1);
      C(2,1)=VecteurValeurs(n2);
      C(3,1)=VecteurValeurs(n3);
      fill(X,Y,C,'LineStyle','none') 
   end
end

colorbar
axis equal
set(gcf, 'Renderer', 'zbuffer');%rend les dégradés de couleurs
                                %plus "nets"  