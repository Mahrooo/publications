function [m2]=vertexDetector_new(A,basic,result_final,E,N)
m1=[];
a=size(A,2)-1;
nEdges=size(E,1);
nNodes=(a-3*nEdges)/2;
%adding variables with zero reduced cost will not change the cost of the objective function:
flagZeroReducedCost=(A(end,1:end-1)==0);
flagNonBasicVariables=ones(1,2*nNodes+3*nEdges);
flagNonBasicVariables(basic(:))=0;
flagNonBasicZeroReducedCost=(flagZeroReducedCost & flagNonBasicVariables);
B=(1:size(A,2)-1);%array of numbers form 1 to #variabels

CandidateIndecesNotBasic=B(flagNonBasicZeroReducedCost);
% flagCandidates=(2*nNodes+1<C);
% CandidateIndecesNotBasic=C(flagCandidates);
basic_final(:,1)=basic;
result_final(1,:)=result_final;
c=0;
B=(1:size(A,1)-1);
cost1=-A(end,end);
cost=[];
%pivot candidate variabels:
for i=1:size(CandidateIndecesNotBasic,2)
    pivotColumn=CandidateIndecesNotBasic(i);
    %to find the pivot row:
    flagPivotColumnPositive=(0<A(1:end-1,pivotColumn));
    pivotRowCandidates=B(flagPivotColumnPositive);
    for p=1:length(pivotRowCandidates)
        if basic(pivotRowCandidates(p))<=2*N
            pivotRowCandidates(p)=0;
        end
    end
    for j=1:size(pivotRowCandidates,2)
        pivotRow=pivotRowCandidates(j);
        basic_new=basic;
        A_new=A;
        if pivotRow~=0
            %         A_new=A;%to keep the original tableau
            %         basic_new=basic;%to keep the original basic variables
            c=c+1;
            %perform pivot (transform A such that pivot column becomes
            %[0;0;...;0;1;0;...;0]
            for l=1:size(A_new,1) %each row:
                if A_new(l,pivotColumn)~=0
                    if l~=pivotRow
                        ratio=-A_new(l,pivotColumn)/A_new(pivotRow,pivotColumn);
                        A_new(l,:)=A_new(l,:)+ratio*A_new(pivotRow,:);
                    else
                        A_new(pivotRow,:)=A_new(pivotRow,:)/A_new(pivotRow,pivotColumn);
                    end
                end
            end
            cost=[cost ; -A_new(end,end)];
            basic_new(pivotRow)=pivotColumn;
            [basic_final(:,c),result_final(c,:),A2]=dual_simplex2(A_new,basic_new);
            m1(c).Matrix=A2;
        end
    end
end
[result_final,index,~]=unique(result_final,'rows');
if ~isempty(m1)
    for i=1:size(index,1)
        m2(i).matrix_A=m1(index(i)).Matrix;
        m2(i).result=result_final(i,:);
        m2(i).COST=cost(i);
        m2(i).basic=basic_final(:,index(i));
    end
else
    m2(1).matrix_A=A;
    m2(1).result=result_final;
    m2(1).COST=cost1;
    m2(1).basic=basic_final;
end
end

