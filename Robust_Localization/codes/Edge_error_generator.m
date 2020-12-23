function Tij_e=Edge_error_generator(Tij_truth,i)
nEdges=size(Tij_truth,2);
e=zeros(2,nEdges);
e1=sign(2*rand(2,1)-ones(2,1));
e2=rand(2,1);
Tij_e=zeros(2,nEdges);
for iEdge=i:nEdges
%    e(:,iEdge)=e1.*(5+10*e2);
     e(:,iEdge)=-(15+10*e2);
end
% e=[100 10 5 55 200 70 20 140 17 302;100 10 5 55 200 70 20 140 17 302];
for iEdge=1:nEdges
    if iEdge==i
        Tij_e(:,iEdge)=Tij_truth(:,iEdge)+e(:,iEdge);
    else
        Tij_e(:,iEdge)=Tij_truth(:,iEdge);
    end
end
end
