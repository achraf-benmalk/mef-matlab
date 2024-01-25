%**************************************************************
% vecteur2D.m                                
%
%fournit les composantes d'un vecteur à partir des 
%coordonnées des 2 points
%**************************************************************

function [V] = vecteur2D(x1,y1,x2,y2)


v1 = x2-x1;
v2 = y2-y1;

V=[v1 v2];
