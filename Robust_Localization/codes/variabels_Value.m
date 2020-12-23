function [Z,S,P]=variabels_Value(finaltableau,nNodes,nEdges,result)
P=finaltableau(size(finaltableau,1),2*nNodes+nEdges+1:end-1);
Z=result(2*nNodes+1:2*nNodes+nEdges);
S(1,:)=result(2*nNodes+nEdges+1:end);
end