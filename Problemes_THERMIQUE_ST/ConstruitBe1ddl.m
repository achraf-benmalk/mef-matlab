%**************************************************************
% ConstruitBe1ddl.m                                
%
%Construit la matrice B des d�riv�es des fonctions de
%forme pour un �l�ment triangulaire
%telle que [Du/Dx Du/Dy]=B*[u1 u2 u3]
%**************************************************************

function [Be]=ConstruitBe1ddl(bx,by,VoisinsContour)

for i=1:length(VoisinsContour)
   Be(1,i)=bx(i);    
   Be(2,i)=by(i);
end
