function plotVoronoi(tree)
for i=1:size(tree,2)
    %plot partitions:
    for j=1:size(tree(i).Ax,1)
        xmin=tree(i).position(1)-3;
        xmax=tree(i).position(1)+3;
        x= linspace(xmin,xmax, 15); % Adapt n for resolution of graph
        b=tree(i).Bx(j);
        a=-tree(i).Ax(j,1);
        y= (a*x+b)/tree(i).Ax(j,2);
        plot(x,y,'c-.')
        hold on
    end
    
    %plot triangels:
    for j=1:size(tree(i).Ah,1)
        xmin=tree(i).position(1)-3;
        xmax=tree(i).position(1)+3;
        x= linspace(xmin,xmax, 15); % Adapt n for resolution of graph
        b=-tree(i).bh(j);
        a=-tree(i).Ah(j,1);
        y= (a*x+b)/tree(i).Ah(j,2);
        plot(x,y,'m-.')
        hold on
    end
     
end
end