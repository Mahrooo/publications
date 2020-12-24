function simulationRRT(tree,y,x0,e,style,t)
u=[100;100];
c=0;
x_n=x0;
i=t;
k=tree(i).k;
while norm(u)>10^-3
    c=c+1;
    x_p=x_n;    
     if abs(norm(tree(tree(i).next).position-x_n,2))<=1
         j=tree(i).next;
         if ~isempty(tree(j).k)
             i=j;
         end
     end
     k=tree(i).k;
     u=(y-x_p*ones(1,size(y,2)))*(k);
    if norm(u)<10^-2
        a=100;
    end
    x_n=x_p+e*u;
    plot(x_n(1),x_n(2),style)
    hold on
    
end
end