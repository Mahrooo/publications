function tree=boxAroundPoint(tree,d,c)
e=1;
nNodes=size(tree,2);
for i=1:nNodes
    idxNext=tree(i).next;
    if isempty(idxNext)
        next=tree(i).position;
    else
        next=tree(idxNext).position;
    end
    current=tree(i).position;
    coeff = polyfit([next(1) current(1)], [next(2) current(2)], 1);
    syms x
    equ1=(x-current(1))^2+(coeff(1)*x+coeff(2)-current(2))^2==d^2;
    sol=solve(equ1,x);
    sol=double(sol);
    for j=1:length(sol)
        if norm([sol(j);sol(j)*coeff(1)+coeff(2)]-next)>norm(next-current)
            X1=sol(j);
        end
    end
    Y1=X1*coeff(1)+coeff(2);
    slop=-1/coeff(1);
    inter=Y1-slop*X1;
    syms x
    equ2=(x-X1)^2+(slop*x+inter-Y1)^2==c^2;
    sol=double(solve(equ2,x));
    X2=sol(1);
    Y2=X2*slop+inter;
    X3=sol(2);
    Y3=X3*slop+inter;
    
    %     inter=next(2)-slop*next(1);
    %     syms x
    %     equ2=(x-next(1))^2+(slop*x+inter-next(2))^2==e^2;
    %     sol=double(solve(equ2,x));
    %     X4=sol(1);
    %     Y4=X4*slop+inter;
    %     X5=sol(2);
    %     Y5=X5*slop+inter;
    %
    %     tree(i).vertices=[X2 X3 X5 X4;Y2 Y3 Y5 Y4];
    tree(i).vertices=[X2 X3 next(1);Y2 Y3 next(2)];
    [A,b]=matrixSet(tree(i).vertices);
    [Ax,bx]=convexSet(A,b,current);
    tree(i).Ah=-Ax;
    tree(i).bh=bx;
%     tree(i).Ah(3,:)=[];
%     tree(i).bh(3)=[];
    tree(i).Ax=Ax;%[tree(i).Ax;Ax];
    tree(i).Bx=bx;%[tree(i).Bx;bx];
end
end