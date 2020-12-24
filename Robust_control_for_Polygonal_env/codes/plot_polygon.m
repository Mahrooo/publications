%plot polygon with out arrows:
function plot_polygon(Y,style)
for i=1:size(Y,2)-1
    x=Y(:,i);
    y=Y(:,i+1);
    plot([x(1) y(1)],[x(2) y(2)],style)
    hold on
end
x=Y(:,end);
y=Y(:,1);
plot([x(1) y(1)],[x(2) y(2)],style)
axis equal
hold on

end

