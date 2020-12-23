%   function robustLocalizability_vertexFinder_test
clear all
close all
[E,Ti_truth]=robustLocalizability_testData('7 nodes');
nNodes=size(Ti_truth,2);
nEdges=size(E,1);
% % a=randi(nEdges,1,floor(nEdges/3)+1);
%  a=[5 6 8 9 10];
%  a=[10 11 12];
% a=[3 16  19 21 1 2 3 4];
[Ax,Ay,basicx,basicy,resultx,resulty,sumE,COST]=dualSimplexSimulation(E,Ti_truth,a);
[basic_finalx,result_finalx,costx]=vertexDetector(Ax,basicx,resultx,E);
[basic_finaly,result_finaly,costy]=vertexDetector(Ay,basicy,resulty,E);
[Xx]=dispResults(result_finalx,nNodes);
[Xy]=dispResults(result_finaly,nNodes);
[solutionx]=verteceeesss(Ax,basicx,resultx,E,nNodes);
[solutiony]=verteceeesss(Ay,basicy,resulty,E,nNodes);
result_N=cat(1,solutionx.result);
[Xx_N]=dispResults(cat(1,solutionx.result),nNodes);
[Xy_N]=dispResults(cat(1,solutiony.result),nNodes);
% [flagZeroIsSolution_X,alpha_X]=CheckZeroIsSolution(Xx);

 XX=plotttt(Ti_truth,E,Xx_N,Xy_N,sumE);
 XX=[Xx Xy];
%  end




