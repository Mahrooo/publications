%function [flag]=polygon_isFilled(vertices)
%Checks the ordering of the vertices, and returns whether the polygon is filled
%in or not.
function [flag]=polygon_isFilled(vertices)
nVertices=size(vertices,2);
startPoints=vertices;
for i=1:nVertices-1
    endPoints(:,i)=vertices(:,i+1);
end
endPoints(:,nVertices)=vertices(:,1);

if (endPoints(1,:)-startPoints(1,:))*(endPoints(2,:)+startPoints(2,:))'<0
    flag=1;
else
    flag=0;
end
end