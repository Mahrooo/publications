%% init parameter
%Wb:weighting factor for cbf, dim = 1
%Wl:weighting factor for clf, dim = number of barrier functions 
%Cb:cbf coefficoient
%Cl:clf coefficoient
Wb = [1;1;1];
Wl = 1;
% Cb = 0.5;
% Cl = 0.5;
K = place([0 1; 0 0],[0; 1],[-1, -2]);

Y = MarkLocation(:);    % vectorlized landmark

nBarriers = size(Ah,1);
nConvex = size(Ax,1);
nVelocity = size(Au,2); 
nLandmark=length(Y);
I = zeros(nLandmark,2);
I(1:nLandmark/2, 1) = 1;
I(nLandmark/2+1:end, 2) = 1;

cvx_begin

    variables Sb(nBarriers) lB(nBarriers, nConvex) K1(nVelocity,nLandmark) K_x(nVelocity,4) ...
        S_l lL(1,nConvex) lU(size(Au,1),nConvex)
    maximize (Wb'*Sb + Wl*S_l) 
    subject to
        for i = 1:nBarriers
            -lB(i, :)*bx + Ah(i,:)*A*B*K1*Y + K(1)*Ab(i) >= Sb(i)
            Ah(i,:)*A*B*K_x + K(1)*Ah(i,:) + K(2)*Ah(i,:)*A + lB(i, :)*Ax == 0
            lB(i, :) >= 0
            Sb(i) >= 0
        end
        K_x(1:2, 1:2) == -K1*I
        
        -lL*bx >= zh*A*B*K1*Y + K(1)*zb + S_l
        lL*Ax == zh*A*B*K_x + K(1)*zh + K(2)*zh*A
        lL >= 0
        S_l >= 0
        
%         -lU*bx >= -bu +Au*K1*Y
%         -Au*K_x + lU*Ax == 0
%         lU >= 0
cvx_end
