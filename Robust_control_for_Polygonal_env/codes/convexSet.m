function [Ax,bx]=convexSet(A,b,p)
Ax=A;
bx=b;
for i=1:size(A,1)
    d=sign(p(2)-(p(1)*A(i,1)+b(i)));
    if d<0
        Ax(i,1)=-Ax(i,1);
    else
        Ax(i,2)=-Ax(i,2);
        bx(i)=-bx(i);
    end
end
end