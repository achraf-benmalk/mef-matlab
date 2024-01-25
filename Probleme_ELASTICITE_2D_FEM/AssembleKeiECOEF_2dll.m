%**************************************************************
% AssembleKeiECOMixteEF_1dll.m                                
%
%Assemble une matrice élémentaire dans la matrice globale
%version : 2 d.d.l./noeud
%**************************************************************


function [Kglob]=AssembleKeiECOEF_2dll(Ke,Kglob,...
    NoeudsDuTri)

%1)Construction du vecteur Assemble

k=0;
for i=1:length(NoeudsDuTri)
   k=k+1;
   Assemble(k)=NoeudsDuTri(i)*2-1;
   k=k+1;
   Assemble(k)=NoeudsDuTri(i)*2;
end

%3)Assemblage de Ke dans Kei

for i=1:length(Assemble)
   for j=1:length(Assemble)
      ligne=Assemble(i);
      colonne=Assemble(j);
      
      Kglob(ligne,colonne)=Kglob(ligne,colonne)+Ke(i,j);
      
   end
end

