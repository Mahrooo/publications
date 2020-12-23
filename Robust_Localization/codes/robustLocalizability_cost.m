function cost=robustLocalizability_cost(Ti,Tij,E,varargin)
flagPerDimension=false; %Return cost separately for each dimension
%optional parameters
ivarargin=1;
while ivarargin<=length(varargin)
    switch lower(varargin{ivarargin})
        case 'perdimension'
            flagPerDimension=true;
        otherwise
            disp(varargin{ivarargin})
            error('Optional argument not recognized')
    end
    ivarargin=ivarargin+1;
end
cost=sum(abs(Ti(:,E(:,2))-Ti(:,E(:,1))-Tij(:,:)),2);
if ~flagPerDimension
    cost=sum(cost);
end