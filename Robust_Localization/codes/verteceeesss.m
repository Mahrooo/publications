function [solution]=verteceeesss(Ax,basicx,resultx,E,N)
[solution]=vertexDetector_new(Ax,basicx,resultx,E,N);
num=size(solution,2);
c=0;
% while ~isempty(queue)
    for i=1:num
       [s]=vertexDetector_new(solution(i).matrix_A,solution(i).basic,solution(i).result,E,N);
       for j=1:size(s,2)
           flag_member=ismember(cat(1,solution.result),cat(1,s(j).result),'rows');
           if ~any(flag_member)
               solution(num+1).matrix_A=s(j).matrix_A;
               solution(num+1).basic=s(j).basic;
               solution(num+1).result=s(j).result;
               solution(num+1).COST=s(j).COST;
               a=s(j).matrix_A;
               num=num+1;
           end
       end
    end
% end 
end