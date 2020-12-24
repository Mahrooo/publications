%function [flagPoints]=polygon_isCollision(vertices,testPoints)
%Checks whether the a point is in collsion with a polygon (that is, inside for a
%filled in polygon, and outside for a hollow polygon).
function [flagPoints]=polygon_isCollision(vertices,testPoints)
nPoints=size(testPoints,2);
flagPoints=true(1,nPoints);
flag=polygon_isFilled(vertices);
for iTestPoint=1:nPoints
    visible=0;
    for iVertex=1:size(vertices,2)
        visible=visible+polygon_isVisible(vertices,iVertex,testPoints(:,iTestPoint));
    end
     if flag==1
        if 0<visible
            flagPoints(1,iTestPoint)=1;
        else
            flagPoints(1,iTestPoint)=0;
        end
     else
        if visible==0
            flagPoints(1,iTestPoint)=1;
        else
            flagPoints(1,iTestPoint)=0;
        end
     end
end
end
