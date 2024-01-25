%**************************************************************
% TraceTriangulation.m                                
%
%Dessine les éléments triangulaire (le maillage)
%**************************************************************

function TraceTriangulation(Connect,Nx,Ny)


%Tracé des éléments triagulaires
hold on
for i=1:size(Connect,1)
   plot([Nx(Connect(i,1)),Nx(Connect(i,2)),Nx(Connect(i,3)),Nx(Connect(i,1))],[Ny(Connect(i,1)),Ny(Connect(i,2)),Ny(Connect(i,3)),Ny(Connect(i,1))],'k-')
end
axis equal