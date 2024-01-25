%**************************************************************
% ImpCLPoutre.m                                
%
%Imposition des conditions aux limites dans
%le problème d'élasticité linéaire (poutre)
%**************************************************************

function [Kglob,fu,ListeDdl,Uresult,P,II]=...
    ImpCLPoutre(Kglob,Nx,Ny,nL,nH,L,H...
    ,ListeNoeudsFrontiere,E,nu,PlaneStress)


%Desription des CL imposées :
%imposition de la solution exacte sur tout le
%bord
%=============================================

ListeDdl = 1:size(Kglob,1);

%initialisation du vecteur fu

for i=1:size(Kglob,1);
    fu(i)=0;
end

%initialisation du vecteur résultat

Uresult = zeros(size(Kglob,1),1);

%CONDITIONS AUX LIMITES DE TYPE DIRICHLET
%------------------------------------------
%Liste des ddl Bloqués

ListeDdlBloques=[];

%Liste des ddl imposés

ListeNoeudsImposesEnUx=ListeNoeudsFrontiere;
ListeNoeudsImposesEnUy=ListeNoeudsFrontiere;

ListeDDLImposesEnUx=ListeNoeudsFrontiere*2-1;
ListeDDLImposesEnUy=ListeNoeudsFrontiere*2;


P=-1000;
II=(H^3)/12;
mu = E/(2*(1+nu));


if PlaneStress==1
    E0=E;
    nu0=nu;
elseif PlaneStress==0
    E0=(E)/(1-nu^2);
    nu0=nu/(1-nu);
end


for i=1:length(ListeDDLImposesEnUx)
    %solution exacte en U
    noeud=(ListeDDLImposesEnUx(i)+1)/2;
    
    X=Nx(noeud);
    Y=Ny(noeud);
    Uex = ( -(P*Y)/(6*E0*II) )*(   (6*L -3*X)*X + (2+nu0)*Y^2  - ((3*H^2)/2 )*(1+nu0)        );
    
    
    for j=1:size(Kglob,1)   
        if ListeDDLImposesEnUx(i)~=j
            fu(j)=fu(j)-Kglob(j,ListeDDLImposesEnUx(i))*Uex;
        end
    end
    Uresult(ListeDDLImposesEnUx(i))=Uex;
end

for i=1:length(ListeDDLImposesEnUy)
    %solution exacte en V
    noeud=(ListeDDLImposesEnUy(i))/2;
    X=Nx(noeud);
    Y=Ny(noeud);
    Vex= (P/(6*E0*II))*(  3*nu0*Y^2*(L - X)   +(3*L-X)*X^2    );
    
    for j=1:size(Kglob,1)   
        if ListeDDLImposesEnUy(i)~=j
            fu(j)=fu(j)-Kglob(j,ListeDDLImposesEnUy(i))*Vex;
        end
    end
    Uresult(ListeDDLImposesEnUy(i))=Vex;
end


%supression des ddl que l'on connaît

ListeDdl = setdiff(ListeDdl,ListeDdlBloques);
ListeDdlImposes= [ListeDDLImposesEnUx ListeDDLImposesEnUy];
ListeDdl = setdiff(ListeDdl,ListeDdlImposes);


