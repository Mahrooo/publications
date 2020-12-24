%this function finds K1
function [K1] = optFirstorder(Wb,Wl,Cb,Cl,z,Ah,Au,Ax,bx,bh,bu,y)
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
Y=zeros(2*size(y,2),1);
for i=1:size(y,2)
    Y(2*i-1)=y(1,i);
    Y(2*i)=y(2,i);
end
nBarriers = size(Ah,1);
nConvex = size(Ax,1);
nVelocity = size(Au,2); 
nLandmark=length(Y);
I=kron(ones(4,1),eye(2));
Wb=[1;1;1;1];
cvx_begin

    variables Sb(nBarriers,1) S_l K1(nVelocity,nLandmark) ...
              lB(nBarriers*nConvex,1) lL(nConvex,1) lU(nVelocity*nConvex,1)

    minimize(Wb'*Sb+Wl*S_l)
    
    subject to
    
        for h=1:nBarriers %constraints for barries:
            lB((h-1)*nConvex+1:h*nConvex,1)'*bx <= Sb(h)+Cb*bh(h)+Ah(h,:)*K1*Y
            Ax'*lB((h-1)*nConvex+1:h*nConvex,1) == (Ah(h,:)*K1*I-Ah(h,:)*Cb)'
        end
        lL'*bx <= S_l-z'*K1*Y%constraints for stability
        Ax'*lL == (-z'*K1*I+z'*Cl)'
        for u=1:nVelocity %constraints for velocity:
            lU((u-1)*nConvex+1:u*nConvex,1)'*bx <= bu(u)-Au(u,:)*K1*Y+5
            Ax'*lU((u-1)*nConvex+1:u*nConvex,1)==(-Au(u,:)*K1*I)'
        end
        lB>=0
        lL>=0
        lU>=0
        Sb<=0
        S_l<=0

cvx_end
end



