%this function plot different solution in same figure:
function a=plotttt(Ti_truth,E,Xx,Xy,sumE)
nX=size(Xx,2);
nY=size(Xy,2);
G=graph_generator(E);

k=0;
Tij_truth = Ti_truth(:,E(:,2))-Ti_truth(:,E(:,1));
Tij_e=Tij_truth+sumE;
XX=[];
XY=[];
for i=1:nX
    for j=1:nY
        k=k+1;
        figure(10+k)
%         subplot(nX,nY,k)
        xx=Xx(:,i)'+Ti_truth(1,:);
        xy=Xy(:,j)'+Ti_truth(2,:);
        x=[xx;xy];
        XY=[XY x(1,:)'];
        XX=[XX x(2,:)'];
        a(k,:)=abs(x(1,E(:,2))-x(1,E(:,1))-Tij_e(1,:));
        setFigFontSize(14)
        plot_graph(x,x,G,E,[],a(k,:))
        
        
        cost1=sum(abs(x(1,E(:,2))-x(1,E(:,1))-Tij_e(1,:)));
        %cost2=sum(abs(x(2,E(:,2))-x(2,E(:,1))-Tij_e(2,:)));
        title(['cost1:  ',num2str(cost1)])
        hold on
    end
end
end