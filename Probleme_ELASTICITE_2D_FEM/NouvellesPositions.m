function [NxResult,NyResult,dx,dy,magn,...
        NxMAgn,NyMAgn]=NouvellesPositions(Nx,Ny,Uresult)

%magnification
magn=100000;
%magn=1;
for i=1:length(Nx)
   dx(i)=Uresult(i*2-1);
   dy(i)=Uresult(i*2);      
end

for i=1:length(Nx)
   NxResult(i)=dx(i)+Nx(i);
   NyResult(i)=dy(i)+Ny(i);
   NxMAgn(i)=dx(i)*magn+Nx(i);
   NyMAgn(i)=dy(i)*magn+Ny(i);
   
end

