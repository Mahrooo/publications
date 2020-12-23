%finding the minimum cost position of the node according to outliers with
%norm L1 function:

% function  T1i=CVX_optimizer_L1(E,Ti_truth,Tij,varargin)
function  T1i=CVX_optimizer_L1(E,Ti_truth,Tij)
%make this function to take as arguments E, Tij, number of nodes
%as optional argument, the location of the first node

% flagFixFirstNode=false;
% %optional parameters
% ivarargin=1;
% while ivarargin<=length(varargin)
%     switch lower(varargin{ivarargin})
%         case 'fixfirstnode'
%             flagFixFirtNode=true;
%             ivarargin=ivarargin+1;
%             T1fixed=varargin{ivarargin};
%         otherwise
%             disp(varargin{ivarargin})
%             error('Optional argument not recognized')
%     end
%     ivarargin=ivarargin+1;
% end

cvx_begin
    variable T1i(2,size(Ti_truth,2));
    minimize(sum(sum(abs(T1i(:,E(:,2))-T1i(:,E(:,1))-Tij))));
%     minimize(norm(T1i(:,edge(:,2))-T1i(:,edge(:,1))-measurement));
    subject to
%     if flagFixFirstNode
        %T1i(:,1)=T1fixed
        T1i(1,1)==Ti_truth(1,1);
        T1i(2,1)==Ti_truth(2,1);
%     end
cvx_end
end
