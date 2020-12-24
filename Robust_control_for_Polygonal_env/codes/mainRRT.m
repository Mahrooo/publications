
% function mainRRT
clear
close all
tree=RRTdata_Tron;
goal=5;
x0=[12;25];
%tree=addStartPoint(x0,tree);
tree=voronoiRRT(tree);
%y=[2 8;6 12; 12 6;9 1]';
y=[5 7;9 23;19 2;20 18]';
plotTree(tree)
plotVoronoi(tree);
plot(y(1,:),y(2,:),'r*')%plots the landmarks
epsilon=0.1;
style='g';
tree=findingControllerRRT(y,tree,goal);
for i=1:size(tree,2)
    if i~=goal
        plotController(y,tree(i).vertices,tree(i).k,'b')%plots the control flow
    end
    hold on
end
p=[1 6 15 16];
for c=3:3
    X=tree(p(c)).position;
    simulationRRT(tree,y,X,epsilon,'r*',p(c))
end
