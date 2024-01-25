%**************************************************************
% ImposeCLPatchTest.m                                
%
%Imposition des conditions aux limites de type Dirichlet
%(Méthode par suppression de lignes)
%**************************************************************

function [Kglob,fu,ListeDdl,Tresult]=ImposeCLPatchTest(Kglob,Nx,Ny,L,H,nx,ny)

ListeDdl = 1:size(Kglob,1); %définition des d.d.l. du prob.

%1)initialisations

for i=1:length(Nx)
   fu(i)=0;
end

Tresult = zeros(size(Kglob,1),1);

%2) Définition des d.d.l. bloqués et imposés

%Liste des ddl Bloqués

ListeNoeudsImposesEnT1=[];

for i=1:length(Nx)
   if Nx(i)==0
      ListeNoeudsImposesEnT1=[ListeNoeudsImposesEnT1 i];
   end
end

ListeDDLImposesEnT1 = ListeNoeudsImposesEnT1;

ListeNoeudsImposesEnT2=[];

for i=1:length(Nx)
   if Nx(i)==L
      ListeNoeudsImposesEnT2=[ListeNoeudsImposesEnT2 i];
   end
end

ListeDDLImposesEnT2 = ListeNoeudsImposesEnT2;

T1 = 100;
T2 = 30;

for i=1:length(ListeDDLImposesEnT1)
   for j=1:size(Kglob,1)   
      if ListeDDLImposesEnT1(i)~=j
         fu(j)=fu(j)-Kglob(j,ListeDDLImposesEnT1 (i))*T1;
      end
   end
   Tresult( ListeDDLImposesEnT1(i))= T1;
end


for i=1:length(ListeDDLImposesEnT2)
   for j=1:size(Kglob,1)   
      if ListeDDLImposesEnT2(i)~=j
         fu(j)=fu(j)-Kglob(j,ListeDDLImposesEnT2(i))*T2;
      end
   end
   Tresult( ListeDDLImposesEnT2(i))= T2;
end

%supression des ddl que l'on connaît

ListeDdl = setdiff(ListeDdl,ListeDDLImposesEnT1);
ListeDdl = setdiff(ListeDdl,ListeDDLImposesEnT2);













