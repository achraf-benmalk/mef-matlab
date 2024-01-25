%**************************************************************
% Trouve1PtsIntDom.m                                
%
%D�finit les coordonn�es et le poids d'un point de Gauss
%dans un �l�ment triangulaire
%**************************************************************


function [ConnectPtCoord]=Trouve1PtsIntDom(pt1,pt2,pt3,NxA,NyA,SxINT,SyINT)



%ConnectPtCoord : connecte 1 pt s
%                d'integration � ses
%                2 coordonn�es

X1=NxA(pt1);
X2=SxINT(pt2);
X3=SxINT(pt3);

Y1=NyA(pt1);
Y2=SyINT(pt2);
Y3=SyINT(pt3);


[OA] = vecteur2D(0,0,X1,Y1);
[AB] = vecteur2D(X1,Y1,X2,Y2);
[AC] = vecteur2D(X1,Y1,X3,Y3);

Ax1=OA+(1/3)*AB+(1/3)*AC;




%Point 1

ConnectPtCoord(1,1)=Ax1(1);
ConnectPtCoord(1,2)=Ax1(2);
