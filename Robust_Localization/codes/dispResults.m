function [X]=dispResults(result,nNodes)
% nEdges=(size(result,2)-2*nNodes)/3;
for i=1:size(result,1)
    for j=1:nNodes
        X(j,i)=result(i,2*j-1)-result(i,2*j);
    end
%     for k=1:nEdges
%         Z(k,i)=result(i,2*nNodes+k);
%     end
end
for i=1:size(X,2)
    t=X(1,i);
    X(:,i)=X(:,i)-t*ones(size(X,1),1);
end
X=(unique(X','rows'))';
end
