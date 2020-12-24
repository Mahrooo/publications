function [A,B]=matrixSet(vertices)
for i=1:size(vertices,2)-1
    X1=vertices(:,i);
    X2=vertices(:,i+1);
    coeff = polyfit([X1(1) X2(1)], [X1(2) X2(2)], 1);
    if coeff(1)>=10^5
        A(i,:)=[1 0];
        B(i,:)=X1(1);
    else
    A(i,:)=[coeff(1) 1];
    B(i,:)=coeff(2);
    end
end
X1=vertices(:,end);
X2=vertices(:,1);
coeff = polyfit([X1(1) X2(1)], [X1(2) X2(2)], 1);
A(end+1,:)=[coeff(1) 1];
B(end+1,:)=coeff(2);
end