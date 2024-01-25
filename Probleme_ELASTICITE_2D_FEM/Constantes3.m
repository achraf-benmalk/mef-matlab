%**************************************************************
% Constantes3.m
%
%D�finition des constantes mat�rielles pour le
%probl�me d'�lasticit� lin�aire
%**************************************************************

function [nu,E,C,PlaneStress]=Constantes3()

PlaneStress=1;

E = 210000*1e6;%Module d'Young
nu=0.3;%coefficient de Poisson

lambda=(E*nu)/((1+nu)*(1-2*nu));
mu = E/(2*(1+nu));
      
if PlaneStress==0
    %D�formations planes
    C=(E/(1-2*nu)*(1+nu))*[(1-nu) nu 0
        nu (1-nu) 0
        0 0 (1-2*nu)/2];
elseif PlaneStress==1
    %Contraintes planes
    C=((E)/(1-nu^2))*[1 nu 0
        nu 1 0
        0 0 (1-nu)/2];
end

