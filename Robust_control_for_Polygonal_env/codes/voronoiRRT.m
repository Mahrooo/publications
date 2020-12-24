function tree=voronoiRRT(tree)
nNodes=size(tree,2);
tree=boxAroundPoint(tree,3,3);
% tree=voronoiPartitions(tree);
for i=1:nNodes
    idxNext=tree(i).next;
    if ~isempty(idxNext)
        z=tree(i).position-tree(idxNext).position;
    else
        z=[];
    end
    tree(i).z=z;
end
end