function [A]=matrix_Building(E,nNodes,Epsilon)
nEdges=size(E,1);
A=zeros(2*nEdges+1,2*nNodes+3*nEdges);
B=zeros(2*nEdges,1);
for iEdge=1:nEdges
    A(2*iEdge-1,2*E(iEdge,1)-1)=-1;
    A(2*iEdge-1,2*E(iEdge,1))=1;
    A(2*iEdge-1,2*E(iEdge,2)-1)=1;
    A(2*iEdge-1,2*E(iEdge,2))=-1;
    A(2*iEdge-1,iEdge+2*nNodes)=-1;
    A(2*iEdge-1,2*iEdge-1+2*nNodes+nEdges)=1;
    
    A(2*iEdge,2*E(iEdge,1)-1)=1;
    A(2*iEdge,2*E(iEdge,1))=-1;
    A(2*iEdge,2*E(iEdge,2)-1)=-1;
    A(2*iEdge,2*E(iEdge,2))=1;
    A(2*iEdge,iEdge+2*nNodes)=-1;
    A(2*iEdge,2*iEdge+2*nNodes+nEdges)=1;
    
    B(2*iEdge-1,1)=Epsilon(iEdge);
    B(2*iEdge,1)=-Epsilon(iEdge);
end
A(2*nEdges+1,2*nNodes+1:2*nNodes+nEdges)=1;
B=[B;0];
A=[A B];

end