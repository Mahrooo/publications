
%function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)
%Given the corner of a polygon, checks whether a given point is self-occluded or
%not by that polygon (i.e., if it is ``inside'' the corner's cone or not). Points
%on boundary (i.e., on one of the sides of the corner) are not considered
%self-occluded.  Note that to check self-occlusion from one vertex, knowing the
%two lines formed with the previous and next vertices (and their ordering) is
%sufficient.
function [flagPoint]=polygon_isSelfOccluded(vertex,vertexPrev,vertexNext,point)

%Use the function edge_angle to check the angle between the segment  vertex--
%point and the segments  vertex-- vertexPrev and  vertex-- vertexNext. The
%function returns  NaN if  vertex1 or  vertex2 coincides with  vertex0.

nPoints=size(point,2);
flagPoint=false(1,nPoints);

vecPrev=vertex-vertexPrev;
vecPrevUnit=vecPrev/norm(vecPrev);

vecNext=vertexNext-vertex;
vecNextUnit=vecNext/norm(vecNext);

edgesAngle=edge_angle(vertex,vertexPrev,vertexNext);

vertices=[vertexPrev vertex vertexNext];

for iPoint=1:nPoints
    vecPoint=point(:,iPoint)-vertex;
    vecPointUnit=vecPoint/norm(vecPoint);
    
    pointEdgePrevAngle=edge_angle(vertex,vertexPrev,point);
    pointEdgeNextvAngle=edge_angle(vertex,point,vertexNext);
    
    if dot(vecNextUnit,vecPointUnit)==1
        if norm(vecPoint)<=norm(vecNext)
            flagPoint(:,iPoint)=0;
        else
             flagPoint(:,iPoint)=1;
        end
    else
        if dot(vecPrevUnit,vecPointUnit)==1% point exists in the same line with one of the dges: 
            if norm(vecPoint)<=norm(vecPrev)
                flagPoint(:,iPoint)=0;
            else
                 flagPoint(:,iPoint)=1;
            end
        else
            if abs(abs(pointEdgePrevAngle)+abs(pointEdgeNextvAngle)-abs(edgesAngle))<10^-5%be in the lower angle of two vector, 
                if polygon_isFilled(vertices)==0 
                    flagPoint(:,iPoint)=0;
                else
                    flagPoint(:,iPoint)=1;
                end
                if polygon_isFilled(vertices)==1
                    flagPoint(:,iPoint)=1;
                else
                    flagPoint(:,iPoint)=0;
                end
            else
                if polygon_isFilled(vertices)==0
                    flagPoint(:,iPoint)=1;
                else
                    flagPoint(:,iPoint)=0;
                end
                if polygon_isFilled(vertices)==1
                    flagPoint(:,iPoint)=0;
                else
                    flagPoint(:,iPoint)=1;
                end
                
            end
        end
    end
end
flagPoint=logical(flagPoint);
end
