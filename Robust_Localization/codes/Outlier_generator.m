function [I,error]=Outlier_generator(nEdges,Tij_truth,a)
error=zeros(2,nEdges);
I=[];
%   a=randi(nEdges,1,floor(nEdges/3)+1);
% a=[1,2,3,4,5,6,10];;
for i=1:size(a,2)
    I=[I a(i)];
    error=error+Tij_truth-Edge_error_generator(Tij_truth,a(i));
end