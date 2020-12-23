function plot_graph(node_result,node_truth,Graph,edge,error_set,a)
%node\-result should be as an output!
setFigFontSize(14)
num=(1:size(edge,1));
plot(Graph,'XData',node_result(1,:),'YData', node_result(2,:),'lineWidth',2)
hold on
 plot(Graph,'XData', node_truth(1,:),'YData',node_truth(2,:),'lineWidth',2)
%
axis equal

hold on
grid on
if ~isempty(a)
    for j=1:size(edge,1)
        txt1=num2str(a(1,j));
setFigFontSize(14)
        text((node_result(1,edge(j,1))+node_result(1,edge(j,2)))/2-0.5,(node_result(2,edge(j,1))+node_result(2,edge(j,2)))/2+0.2,txt1)
    end
end

% ,'EdgeLabel',Graph.Edges.Weight
% E=table2array(Graph.Edges);
n=size(error_set,2);
for k=1:n
    i=edge(error_set(1,k),:);
    x1=node_truth(1,i(1,:));
    x2=node_truth(2,i(1,:));
    setFigFontSize(14)
    plot(x1,x2,'b','lineWidth',2.5)
    hold on
end
xlabel('X')
ylabel('Y')
% axis([-2 20 -2 20])
% title('pose graph')
legend('accurate edge','edge with outlier')

end

