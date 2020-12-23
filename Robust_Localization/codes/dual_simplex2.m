function [basic,result,A]=dual_simplex2(A,basic)
columns=size(A,2);
x=zeros(1,columns);
x(1,columns)=100;

%initialization:
result=zeros(1,size(A,2)-1);
flagBasicSolutionInfeasible=true;

while flagBasicSolutionInfeasible
  [~ ,pivotRow]=min(A(1:(size(A,1)-1),end));    
    %find pivot column
    flagAPivotRowPositive=A(pivotRow,1:end-1)<0;
    x(flagAPivotRowPositive)=A(end,flagAPivotRowPositive)./abs(A(pivotRow,flagAPivotRowPositive));
    x(~flagAPivotRowPositive)=Inf;
    [~ ,pivotColumn]=min(x);    

    %perform pivot (transform A such that pivot column becomes
    %[0;0;...;0;1;0;...;0]
    for i=1:size(A,1) %each row:
        if A(i,pivotColumn)~=0
            if i~=pivotRow
                ratio=-A(i,pivotColumn)/A(pivotRow,pivotColumn);
                A(i,:)=A(i,:)+ratio*A(pivotRow,:);
            else
                A(pivotRow,:)=A(pivotRow,:)/A(pivotRow,pivotColumn);
            end
        end
    end
    %update indexes in the basic set
    basic(pivotRow)=pivotColumn;

    %if the basic solution (last column of A) is feasible, we will stop
    flagBasicSolutionInfeasible=any(A(1:end-1,end)<0);

end

result(1,basic(:))=A(1:(size(A,1)-1),end);

 end