close all
%plotTree(tree)
%plotVoronoi(tree);
p=[1 6 15 16];
s=["b.","r.","g.","c.","m."];
for c=1:4
    X=tree(p(c)).position;
    simulationRRT(tree,y,X,epsilon,s(c),p(c))
end


box(1).data=[0 23; 9 23;9 28;0 28]';
box(2).data=[0 8;5 8;5 15;0 15]';
box(3).data=[0 0;9 0;9 8;0 8]';
box(4).data=[19 0;23 0;23 5;19 5]';
box(5).data=[23 0;27 0;27 11.5;23 11.5]';
box(6).data=[17 9;17 11;13 11;13 9]';
box(7).data=[13 9;13 20;11 20;11 9]';
box(8).data=[17 15;20 15;20 28;17 28]';
box(9).data=[20 15;23 15;23 18;20 18]';
box(10).data=[20 23;23 23;23 25;20 25]';


for i=1:10
    h=fill(box(i).data(1,:),box(i).data(2,:),'black');
    h.FaceAlpha=0.3;
    hold on
end
axis([0 27 0 27])