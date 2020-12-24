function [Ax,bx]=voronoiPartitions(tree,i)
  [Ax,bx]=voronoiAroundPoint(tree,i);
% nNodes=size(tree,2);
% for i=1:nNodes
%     Aprep=[];
%     Bprep=[];
%     [Ax,bx]=voronoiAroundPoint(tree,i);
%     tree(i).Ax=[tree(i).Ax;Ax];
%     tree(i).Bx=[tree(i).Bx;bx];
% end
end