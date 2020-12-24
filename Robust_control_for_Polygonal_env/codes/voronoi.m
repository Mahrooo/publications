function [z,vertices]=voronoi(prior,post,c,d)
z=prior-post;
coefficients = polyfit([prior(1), post(1)], [prior(2), post(2)], 1);
slop=coefficients(1);

if abs(slop)<10^-5
    y1=post(2)+c;
    y2=post(2)-c;
    y3=prior(2)-d;
    y4=prior(2)+d;
    vertices=[post(1) post(1) prior(1)  prior(1);y1 y2 y3 y4];
else
    if abs(slop)<10^6%normal:
        slop1=-1/slop;
        inter1=post(2)-slop1*post(1);
        syms x
        eq1=(x-post(1))^2+((slop1*post(1)+inter1)-post(2))^2==c^2;
        x1=double(solve(eq1,x));
        y1=x1(1)*slop1+inter1;
        y2=x1(2)*slop1+inter1;
        
        inter2=prior(2)-slop1*prior(1);
        syms x
        eq1=(x-prior(1))^2+((slop1*prior(1)+inter2)-prior(2))^2==d^2;
        x2=double(solve(eq1,x));
        y3=x2(1)*slop1+inter2;
        y4=x2(2)*slop1+inter2;
        vertices=[x1(1) x1(2) x2(2) x2(1);y1 y2 y4 y3];
    else
        x1=post(1)+c;
        x2=post(1)-c;
        x3=prior(1)-d;
        x4=prior(1)+d;
        vertices=[x1 x2 x3 x4;post(2) post(2) prior(2)  prior(2)];
    end
end
plot_polygon(vertices,'k')
hold on
plot([prior(1) post(1)],[prior(2) post(2)],'b-.')
plot([prior(1) post(1)],[prior(2) post(2)],'r*')
end