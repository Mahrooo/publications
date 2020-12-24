function plotTree(tree)
for i=1:size(tree,2)
    plot(tree(i).position(1),tree(i).position(2),'ro')
    hold on 
    for j=1:length(tree(i).neighbor)
        idx=tree(i).neighbor(j);
        plot([tree(i).position(1) tree(idx).position(1)],...
             [tree(i).position(2) tree(idx).position(2)],'b','LineWidth',2)
        hold on
    end
end
axis equal
axis([0 27 0 27])
end