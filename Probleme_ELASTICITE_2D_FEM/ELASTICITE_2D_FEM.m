%**************************************************
%                                                 *
%       Probl�me  : Elastiict� 2D                 *
%       M�thode des �l�ments finis                *
%       poutre en flexion                         *
%       ELASTICITE_2D_FEM.m                       *
%                                                 *
%**************************************************

clear all
close all
format long

%1) D�finir les caract�ristiques du mat�riau
L=1;
H=1/5;
nH=input('entrez le nombre de noeuds suivant Y');
nL=round( nH*5 );

l=L/(nL-1);
h=H/(nH-1);
[nu,E,C,PlaneStress]=Constantes3;

%2) D�finition du maillage

[Nx,Ny,Connect]=MaillageRectangleEF2D(L,H,nL,nH);
[ListeNoeudsFrontiere]=NoeudsBordRectangle(nL,nH);


%3) Assembler la matrice de rigidit�
NbPtInt=3;
[Kglob]=AssembleKP1_2dll(Connect,Nx,Ny,...
    H,NbPtInt,C);

%4) Imposition des conditions aux limites
[Kglob,fu,ListeDdl,Uresult,P,II]=...
    ImpCLPoutre(Kglob,Nx,Ny,nL,nH,L,H...
    ,ListeNoeudsFrontiere,E,nu,PlaneStress);


%5) R�solution du probl�me lin�aire
Uresult(ListeDdl)=(Kglob(ListeDdl,ListeDdl))\fu(ListeDdl)'

%6) Post-traitement
PostTraiPoutre(Nx,Ny,Uresult,P,E,II,L,H,...
    nu,Connect,PlaneStress,NbPtInt,C);
