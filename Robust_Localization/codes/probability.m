% function result=probability
clear all
close all
[E,Ti_truth]=robustLocalizability_testData('8 nodes');
nNodes=size(Ti_truth,2);
cc=combination(size(E,1));

start=11;
eend=130;
for i=start:eend
    close all
    [Ax,~,basicx,~,resultx,~,sumE]=dualSimplexSimulation(E,Ti_truth,cc(i).c);
    [solutionx]=verteceeesss(Ax,basicx,resultx,E,nNodes);
    [Xx]=dispResults(cat(1,solutionx.result),nNodes);
    
    NORM=[];
    for k=1:size(Xx,2)
        NORM(k)=norm(Xx(:,k),1);
    end
%     nNorm(i-start+1).norm=NORM;
%     nNorm(i-start+1).X=Xx;
    if sum(ismember(NORM,0))>0
        result(i-start+1).outlier=cc(i).c;
        result(i-start+1).ver=1;
        result(i-start+1).norm=NORM;
        result(i-start+1).X=Xx;
    else
        result(i-start+1).norm=NORM;
        result(i-start+1).X=Xx;
        result(i-start+1).outlier=cc(i).c;
        result(i-start+1).ver=Inf;
    end
end

% end
% end