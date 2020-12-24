%function [flagPoints]=polygon_isVisible(vertices,indexVertex,testPoints)
%Checks whether a point $p$ is visible from a vertex $v$ of a polygon. In order
%to be visible, two conditions need to be satisfied: enumerate  point $p$ should
%not be self-occluded with respect to the vertex $v$\\ (see
%polygon_isSelfOccluded).  segment $p$--$v$ should not collide with  any of the
%edges of the polygon (see edge_isCollision). enumerate
 function [flagPoints,collision, selfOccluded]=polygon_isVisible(vertices,indexVertex,testPoints)

%Note that, with the definitions of edge collision and self-occlusion given in
%the previous questions, a vertex should be visible from the previous and
%following vertices in the polygon.

collision=0;
nPoints=size(testPoints,2);
flagPoints=false(1,nPoints);


nVertices=size(vertices,2);
vertex=vertices(:,indexVertex);

if indexVertex==1
    vertexPrev=vertices(:,nVertices);
else
    vertexPrev=vertices(:,indexVertex-1);
end
if indexVertex==nVertices
    vertexNext=vertices(:,1);
else
    vertexNext=vertices(:,indexVertex+1);
end

nTestPoints=size(testPoints,2);
for iPoint=1:nTestPoints
    vertices1=[vertex testPoints(:,iPoint)];
    selfOccluded=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,testPoints(:,iPoint));
    for iVertex=1:nVertices-1
        vertices2(:,1)=vertices(:,iVertex);
        vertices2(:,2)=vertices(:,iVertex+1);
        collision=collision+edge_isCollision(vertices1,vertices2);
    end
    %even if one of edges has intersection with the vector from the
    %testPoint to the vertex, we have collision, so its not visible
    collision=collision+edge_isCollision(vertices1,[vertices(:,nVertices) vertices(:,1)]);
    
    if selfOccluded==0 && collision==0
        flagPoints(1,iPoint)=1;
    else
        flagPoints(1,iPoint)=0;
    end
end
 end
