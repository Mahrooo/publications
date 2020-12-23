function print_result(E,Tij_e,Z,S,P,COST,nEdges,nNodes)
nEdges=size(E,1);
% X direction
fprintf('\n\nFor X direction\n')
 for iEdge = 1:nEdges
     fprintf('P=%d: X%d - X%d - %0.01f  <%0.01f\n',P(1,iEdge*2-1),E(iEdge,2),E(iEdge,1),Z(1,iEdge),Tij_e(1,iEdge))
     fprintf('P=%d: -X%d + X%d - %0.01f <%0.01f\n',P(1,iEdge*2),E(iEdge,2),E(iEdge,1),Z(1,iEdge),-Tij_e(1,iEdge))
 end
% %Y direction
% fprintf('\n\nFor Y direction\n')
%  for iEdge = 1:nEdges
%      fprintf('P=%d:  X%d - X%d - %0.01f  <%0.01f\n',P(2,iEdge*2-1),E(iEdge,2),E(iEdge,1),Z(2,iEdge),Tij_e(2,iEdge))
%      fprintf('P=%d: -X%d + X%d - %0.01f  <%0.01f\n',P(2,iEdge*2),E(iEdge,2),E(iEdge,1),Z(2,iEdge),-Tij_e(2,iEdge))
%  end
% fprintf('true    cost: %0.001f   %0.001f \n',COST.Truth)
% fprintf('l1-norm cost: %0.001f   %0.001f \n',COST.CVX)

end