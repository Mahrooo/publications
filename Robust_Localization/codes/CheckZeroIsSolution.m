%this functin check if we can have zero as convex combination of other
%corners: A is set of vectors which are the corners.
function [flagZeroIsSolution,alphax]=CheckZeroIsSolution(A)
cvx_begin
variable alphax(size(A,2),1)
maximize sum(( A*alphax))
subject to
A*alphax==0;
sum(alphax)==1;
-10^-3<=alphax;
cvx_end

flagInfinit=any(isinf(alphax));
flagEmpty=any(isnan(alphax));
flagZeroIsSolution=~any([flagInfinit,flagEmpty]);
end