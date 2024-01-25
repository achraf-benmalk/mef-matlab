%**************************************************
%                                                 *
%       Problème 1 : THERMIQUE STATIONNAIRE       *
%          Méthode des éléments finis             *
% 
% <html>
% <table border=1><tr><td>one</td><td>two</td></tr></table>
% </html>
% 
%               stationnaire                      *
%                                                 *
%**************************************************

clear all
close all
format long

%1) Création du maillage
%==================================================

L=1;
H=1;
nx=input('entrze le nombre de noeuds suivant x');
ny=input('entrze le nombre de noeuds suivant y');

[Nx,Ny,Connect,nx,ny]=MaillageRectangleEF2D(L,H,nx,ny);
axis equal
plot (Nx,Ny,'k.') %dessin des noeuds
hold on
TraceTriangulation(Connect,Nx,Ny); %dessin des éléments
pause

%2) Assemblage de la matrice de conductivité K
%==================================================

NbPtInt=1;%nombre de points de Gauss par triangle

[Kglob]=AssembleKP11dll(Connect,Nx,Ny,H,NbPtInt);

%3) Imposition des conditions aux limites
%==================================================

[Kglob,fu,ListeDdl,Tresult]=ImposeCLPatchTest(Kglob,Nx,Ny,L,H,nx,ny);

%4) Résolution du problème
%==================================================

Tresult(ListeDdl)=(Kglob(ListeDdl,ListeDdl))\fu(ListeDdl)';

%5) PostTraitement
%==================================================

DessineValeurs(Tresult,Nx,Ny,Connect);
TraceTriangulation(Connect,Nx,Ny);
