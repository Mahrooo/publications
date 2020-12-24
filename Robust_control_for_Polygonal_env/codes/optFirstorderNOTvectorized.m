%this function finds K1
function [K1] = optFirstorderNOTvectorized(Wb,Wl,Cb,Cl,z,Ah,Au,Ax,bx,bh,bu,Y)
%Wb:steering factor for cbf
%Wl:steering factor for clf
%Cb:cbf coefficoient
%Cl:clf coefficoient
%z:exit direction 
%Ah:barrier matrix
%bh:barrier bias
%Au:velocity matrix
%bu:velocity bias
%Ax:convex cell matrix
%bx:convex cell bias
%Y: vectorized of landmarks
%d:dimestion

nBarriers = size(Ah,1);
nConvex = size(Ax,1);
nVelocity = size(Au,1); 
nLandmark=size(Y,2);
cvx_begin

    variables Sb(nBarriers,1) S_l K1(nLandmark,1) ...
              lB(nBarriers*nConvex,1) lL(nConvex,1) lU(nVelocity*nConvex,1)

    minimize(Wb'*Sb+Wl*S_l)
    
    subject to
    
        for h=1:nBarriers %constraints for barries:
            lB((h-1)*nConvex+1:h*nConvex,1)'*bx <= Sb(h)+Cb*bh(h)+Ah(h,:)*Y*K1
            Ax'*lB((h-1)*nConvex+1:h*nConvex,1) == ((ones(1,nLandmark)*K1)*Ah(h,:)-Ah(h,:)*Cb)'
        end
        lL'*bx <= S_l-z'*Y*K1%constraints for stability
        Ax'*lL == (-(ones(1,nLandmark)*K1)*z'+z'*Cl)'
        for u=1:nVelocity %constraints for velocity:
            lU((u-1)*nConvex+1:u*nConvex,1)'*bx <= bu(u)-Au(u,:)*Y*K1+5
            Ax'*lU((u-1)*nConvex+1:u*nConvex,1)==(-(ones(1,nLandmark)*K1)*Au(h,:))'
        end
        lB>=0
        lL>=0
        lU>=0
        Sb<=0
        S_l<=0
%         K1>=0

cvx_end
% result.K=K1;
% result.lB=lB;
% result.lU=lU;
% result.lL=lL;
% result.Sb=Sb;
% result.Sl=S_l;
% result.cost=cvx_optval;
end



