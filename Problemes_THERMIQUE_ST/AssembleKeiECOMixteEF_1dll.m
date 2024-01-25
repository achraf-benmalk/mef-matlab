%**************************************************************
% AssembleKeiECOMixteEF_1dll.m                                
%
%Assemble une matrice élémentaire dans la matrice globale
%version : 1 d.d.l./noeud
%**************************************************************


function [Kglob]=AssembleKeiECOMixteEF_1dll(Ke,Kglob,...
    NoeudsDuTri)

%1)Construction du vecteur Assemble

k=0;
for i=1:length(NoeudsDuTri)
   k=k+1;
   Assemble(k)=NoeudsDuTri(i);
end

%3)Assemblage de Ke dans Kei

for i=1:length(Assemble)
   for j=1:length(Assemble)
      ligne=Assemble(i);
      colonne=Assemble(j);
      Kglob(ligne,colonne)=Kglob(ligne,colonne)+Ke(i,j);
      
   end
end

