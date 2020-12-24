function plotController(yt,y,k,style)

Xx=min(y(1,:)):1:max(y(1,:));
Yy=min(y(2,:)):1:max(y(2,:));
minn=100;
for i=1:size(Xx,2)
    for j=1:size(Yy,2)
        p=[Xx(i);Yy(j)];
        [flagPoints]=polygon_isCollision(y,p);
        if flagPoints==0
            Y=(yt-p*ones(1,size(yt,2)));
%             for i=1:size(Y,2)
%                 M(2*i-1,1)=y(1,i);
%                 M(2*i,1)=y(2,i);
%             end
%             Y=M;
%             u=k*Y;
            u=Y*k;%for notvectorized version
            if norm(u)<minn
                minn=norm(u);
            end
            quiver(p(1),p(2),u(1),u(2),'Color', [0.75 0.75 0.75])
            hold on
        end
    end
end