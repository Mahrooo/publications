function x_p=simulationOFpath(k,y,x0,e,style)
x_n=x0;
i=1;
x_p=zeros(2,1);
c=0;
u=1;
while  (norm(u)>=0.01) &&(c<100)
    c=c+1;
    x_p=x_n;
    u=(y-x_p*ones(1,size(y,2)))*(k);
    x_n=x_p+e*u;
    figure(1)
    plot(x_n(1),x_n(2),style)
    hold on    
end
