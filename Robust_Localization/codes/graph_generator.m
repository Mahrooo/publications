function G=graph_generator(edge)
edge_num=size(edge,1);
s = edge(:,1);
t = edge(:,2);
for i=1:edge_num
w(1,i)=i;
end
G=graph(s,t,w);
end