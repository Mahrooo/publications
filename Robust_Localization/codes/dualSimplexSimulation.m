function [finaltableauX,finaltableauY,basicx,basicy,resultx,resulty,sumE,COST]=dualSimplexSimulation(E,Ti_truth,a)
%,Ti_result
%then compare errors
cost=zeros(3,2);
nNodes=size(Ti_truth,2);
Tij_truth = Ti_truth(:,E(:,2))-Ti_truth(:,E(:,1));

nEdges=size(E,1);
G=graph_generator(E);
%Adding outliers
%%
[I,sumE]=Outlier_generator(nEdges,Tij_truth,a);
% sumE=[8.89287799578684,8.98338749429613,14.8867530609728,8.25174845617591,10.4947732534106,11.5779958412652,0,0,0,11.5816531211014];
sumE(2,:)=0;% only on X direction!
% sumE=[10 5 0;0 0 0];
% sumE=[0,0,0,0,25,20,0.130,15,10,5;0,0,0,0,0,0,0,0,0,0];
Tij_e=Tij_truth+sumE;
%%
%Finding the position by CVX
  Ti_result= CVX_optimizer_L1(E,Ti_truth,Tij_e);
% use the function robustLocalizability_cost(...,'perDimension') to compute each one of these
COST.CVX=robustLocalizability_cost(Ti_result,Tij_e,E,'perDimension');
COST.Truth=robustLocalizability_cost(Ti_truth,Tij_e,E,'perDimension');
%%
%Optimizing Canonical form:
TX=sumE(1,:);
TY=sumE(2,:);

[tableauX]=matrix_Building(E,nNodes,TX);%creating the tableau
[tableauY]=matrix_Building(E,nNodes,TY);%creating the tableau
columns=size(tableauX,2);
basic=(2*nNodes+nEdges+1:columns-1)';

[basicx,resultx,finaltableauX]=dual_simplex2(tableauX,basic);
[basicy,resulty,finaltableauY]=dual_simplex2(tableauY,basic);
%%
%Collecting data from Canonical form result:
%X direction:
[Zx,Sx,Px]=variabels_Value(finaltableauX,nNodes,nEdges,resultx);
%Y Direction:
[Zy,Sy,Py]=variabels_Value(finaltableauY,nNodes,nEdges,resulty);


S=[Sx;Sy];
Z=[Zx;Zy];
P=[Px;Py];
%%
% %Print results:
 print_result(E,[TX;TY],Z,S,P,COST,nEdges,nNodes)
%%

figure(1)
% setFigFontSize(8)
plot_graph(Ti_truth,Ti_truth,G,E,I,[])
quiver(Ti_truth(1,E(:,1)),Ti_truth(2,E(:,1)),Ti_truth(1,E(:,2))-Ti_truth(1,E(:,1)),Ti_truth(2,E(:,2))-Ti_truth(2,E(:,1)),0,'r')
% legend('result','exact')
end