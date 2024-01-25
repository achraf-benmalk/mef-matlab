%**************************************************************
% aireTRIANGLE.m                                
%
%Calcule l'aire d'un triangle donn� par les coordonn�es
%de ses sommets A, B et C
%**************************************************************

%Calcule l'aire d'un triangle

function a=aireTRIANGLE(Ax,Bx,Cx,Ay,By,Cy)

b = ((Ax-Cx)*(By-Cy)-(Bx-Cx)*(Ay-Cy))/2;
a=sqrt(b*b);

