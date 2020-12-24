% function mainRRT
clear all
close all
prior=[2;3];
post=[6;10];
c=2;
d=10;
[z,y]=voronoi(prior,post,c,d);
mid=(post+prior)/2;
[A,b]=matrixSet(y);
[Ax,bx]=convexSet(A,b,mid);
Ah=-Ax(2:4,:);
bh=bx(2:4);
[~,~,~,~,Cl,Cb,Wl,Wb,Au,bu,~,~]=data;
[result] = optFirstorderNOTvectorized(Wb,Wl,Cb,Cl,z,Ah,Au,Ax,bx,bh,bu,y);
K1=result.K;
plotController(y,y,K1,'b')%plots the control flow
plot_polygon(y,'K')%plots the polygon
plot(y(1,:),y(2,:),'r*')%plots the landmarks
quiver(post(1),post(2),z(1),z(2),'g');
% end