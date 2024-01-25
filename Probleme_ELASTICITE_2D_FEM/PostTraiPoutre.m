%**************************************************************
% PostTraiPoutre.m                                
%
% Post-traitement pour le problème de poutre
% élastique
%**************************************************************

function []= PostTraiPoutre(Nx,Ny,Uresult,P,E,II,L,H,...
    nu,Connect,PlaneStress,NbPtInt,C)

close all

%1) Affichage des nouvelles positions

[NxResult,NyResult,dx,dy,magn,...
        NxMAgn,NyMAgn]=NouvellesPositions(Nx,Ny,Uresult);
hold on

%maillage non-déformé
TraceTriangulation(Connect,Nx,Ny); 
%dessin de la déformation
TraceTriangulation(Connect,NxMAgn,NyMAgn); 

%Affichage des solutions exactes

if PlaneStress==1
    E0=E;
    nu0=nu;
    kappa = (3-nu)/(1+nu);%contraintes planes
elseif PlaneStress==0
    E0=(E)/(1-nu^2);
    nu0=nu/(1-nu);
    kappa = 3-4*nu;%defs planes
end


for i=1:length(Nx)
    X=Nx(i);
    Y=Ny(i);
    Uex = ( -(P*Y)/(6*E0*II) )*(   (6*L -3*X)*X + (2+nu0)*Y^2  - ((3*H^2)/2 )*(1+nu0)        );
    Vex= (P/(6*E0*II))*(  3*nu0*Y^2*(L - X)   +(3*L-X)*X^2    );


    dxEx(i)=Uex;
    dyEx(i)=Vex;

    NxMAgnEx(i)=dxEx(i)*magn+Nx(i);
    NyMAgnEx(i)=dyEx(i)*magn+Ny(i);
    errX(i)=dx(i)-dxEx(i);
    errY(i)=dy(i)-dyEx(i);
end

hold on
for i=1:length(Nx)
    plot(NxMAgnEx(i),NyMAgnEx(i),'ko');
end



