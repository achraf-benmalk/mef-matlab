function [ConnectPtCoord]=Trouve3PtsIntDom(pt1,pt2,pt3,NxA,NyA,SxINT,SyINT)

%ConnectPtCoord : connecte 3 pt s
%                d'integration à ses
%                2 coordonnées

X1=NxA(pt1);
X2=SxINT(pt2);
X3=SxINT(pt3);

Y1=NyA(pt1);
Y2=SyINT(pt2);
Y3=SyINT(pt3);


[OA] = vecteur2D(0,0,X1,Y1);
[AB] = vecteur2D(X1,Y1,X2,Y2);
[AC] = vecteur2D(X1,Y1,X3,Y3);

Ax1=OA+(1/6)*AB+(1/6)*AC;
Ax2=OA+(2/3)*AB+(1/6)*AC;
Ax3=OA+(1/6)*AB+(2/3)*AC;



%Point 1

ConnectPtCoord(1,1)=Ax1(1);
ConnectPtCoord(1,2)=Ax1(2);

%Point 2

ConnectPtCoord(2,1)=Ax2(1);
ConnectPtCoord(2,2)=Ax2(2);

%Point 2

ConnectPtCoord(3,1)=Ax3(1);
ConnectPtCoord(3,2)=Ax3(2);


%

%Tracé
%pause
%hold on
%plot([NxA(pt1) SxINT(pt2) SxINT(pt3) NxA(pt1)],[NyA(pt1) SyINT(pt2) SyINT(pt3) NyA(pt1)],'r-');

%plot( ConnectPtCoord(1,1), ConnectPtCoord(1,2) ,'ro');
%plot( ConnectPtCoord(2,1), ConnectPtCoord(2,2) ,'ro');
%plot( ConnectPtCoord(3,1), ConnectPtCoord(3,2) ,'ro');
