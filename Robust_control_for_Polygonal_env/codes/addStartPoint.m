function tree=addStartPoint(x0,tree)
d=norm(x0-tree(1).position);
idx=1;
for i=2:size(tree,2)
    c=norm(x0-tree(i).position);
    if c<d
        d=c;
        idx=i;
    end
end
tree(end+1).position=x0;
tree(end).next=idx;
tree(end).neighbor=idx;

end