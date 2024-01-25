%**************************************************************
% aireTRIANGLE.m                                
%
%Calcule l'aire d'un triangle donné par les coordonnées
%de ses sommets A, B et C
%**************************************************************

%Calcule l'aire d'un triangle

function a=aireTRIANGLE(Ax,Bx,Cx,Ay,By,Cy)

b = ((Ax-Cx)*(By-Cy)-(Bx-Cx)*(Ay-Cy))/2;
a=sqrt(b*b);

