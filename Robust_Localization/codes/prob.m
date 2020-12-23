% % load('result');
% 
% for i=1:10
%     cu=0;
%     cnu=0;
%     for j=1:size(result,2)
%         if size(result(j).outlier,2)==i
%             if result(j).uver==1
%                 cu=cu+1;
%             end
%             if result(j).ver==1
%                 cnu=cnu+1;
%             end
%             
%         end
%     end
%     
%     P(i).u=cu;
%     P(i).nu=cnu;
% end
syms p
y=(1-p)^10+10*(1-p)^9*p+45*p^2*(1-p)^8+115*p^3*(1-p)^7+181*p^4*(1-p)^6+164*p^5*(1-p)^5+72*p^4*(1-p)^6;
ezplot(y,[0,1])

% 
