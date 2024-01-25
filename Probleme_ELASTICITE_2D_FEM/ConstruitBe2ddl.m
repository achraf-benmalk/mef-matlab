%**************************************************************
% ConstruitBe2ddl.m                                
%
%Construit la matrice B des d�riv�es des fonctions de
%forme pour un �l�ment triangulaire
%pour 2 dll/noeuds
%telle que [Du/Dx Du/Dy]=B*[u1 u2 u3]
%**************************************************************

function [Be]=ConstruitBe2ddl(bx,by,VoisinsContour)

for i=1:length(VoisinsContour)
    Be(1,i*2-1)=bx(i);    
    Be(2,i*2)=by(i);
    Be(3,i*2-1)=by(i);    
    Be(3,i*2)=bx(i);
end
