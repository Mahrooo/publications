function [Ax,bx]=voronoiAroundPoint(tree,k)

numNeighbors=length(tree(k).neighbor);
current=tree(k).position;

for i=1:numNeighbors
    idxNext=tree(k).neighbor(i);
    next=tree(idxNext).position;
    [a,b]=lineEquation(current,next);
    A(i,:)=a;
    B(i,:)=b;
end

[Ax,bx]=convexSet(A,B,current);
end