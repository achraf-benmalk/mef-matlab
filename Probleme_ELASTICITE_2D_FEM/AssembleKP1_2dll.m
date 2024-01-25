%**************************************************************
% AssembleKP1_2dll.m                                
%
%construction de la matrice globale de rigidité
%**************************************************************

function [Kglob]=AssembleKP1_2dll(Connect,Nx,Ny,...
    H,NbPtInt,C);

%1) Initialisation de la matrice de rigidite
%   globale

Kglob=sparse(zeros(  2*length(Nx) ));

%2) BOUCLE SUR TOUS LES ELEMENTS TRIANGULAIRES

for i=1:size(Connect,1)
    
    tri=i;
    
    %2-1) Définir le triangle
    n1 = Connect(i,1);
    n2 = Connect(i,2);
    n3 = Connect(i,3);
    
    %2-2) Calculer l'aire du triangle
    
    Ax=Nx(n1);
    Ay=Ny(n1);
    Bx=Nx(n2);
    By=Ny(n2);
    Cx=Nx(n3);
    Cy=Ny(n3);
    
    aireTrI=aireTRIANGLE(Ax,Bx,Cx,Ay,By,Cy);
    
    %2-3) Trouver les 3 points d'intégration
    
    if NbPtInt==1
        [ConnectPtCoord]=Trouve1PtsIntDom(n1,n2,n3,Nx,Ny,Nx,Ny);
    elseif NbPtInt==3
        [ConnectPtCoord]=Trouve3PtsIntDom(n1,n2,n3,Nx,Ny,Nx,Ny);
    elseif NbPtInt==6
        [ConnectPtCoord,Poids6]=Trouve6PtsIntDom(n1,n2,n3,Nx,Ny,Nx,Ny);
    elseif NbPtInt==12
        [ConnectPtCoord,Poids12]=Trouve12PtsIntDom(n1,n2,n3,Nx,Ny,Nx,Ny);
    end
    
    %2-4)Pour chacun des points d'intégration

    for l=1:NbPtInt
        
        X = ConnectPtCoord(l,1);
        Y = ConnectPtCoord(l,2);
        
        if NbPtInt==1
            poids=1;
        elseif NbPtInt==3
            poids=1/3;
        elseif NbPtInt==6
            poids=Poids6(l);
        elseif NbPtInt==12
            poids=Poids12(l);
        end
        
        %2-4-1) Calcul des dérivées des fonctions de
        %   forme
        
        [fforme,deriveesX,deriveesY,Voisins]...
            =fformeEtDeriveesFEM_P1_1Pt(X,Y,tri,Connect,Nx,Ny);
        
        %2-4-2) construire la matrice B des dérivées
        NoeudsDuTri=[n1 n2 n3];
        [Be]=ConstruitBe2ddl(deriveesX,deriveesY,Voisins);

        %2-4-3) Calcul des matrices élémentaire
        
        Ke=Be'*C*Be*poids*aireTrI;
        
        %2-4-4) Assemblage dans la matrice globale
        
        [Kglob]=AssembleKeiECOEF_2dll(Ke,Kglob,...
            NoeudsDuTri);    
        
    end
    
end
