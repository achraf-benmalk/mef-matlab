%**************************************************************
% NoeudsBordRectangle.m                                
%
%D�finition des noeuds du bord pour un domaine
%rectangulaire
%**************************************************************

function [ListeNoeudsFrontiere]=NoeudsBordRectangle(nL,nH)

%D�finition du bord ext�rieur

A=1:nH:(nL-1)*nH+1;
B=(nL-1)*nH+2:1:nL*nH;
C=(nL-1)*nH : -nH : nH;
D=nH-1:-1:2;

ListeNoeudsFrontiere=[A B C D];