function V=findingControllerRRT(y,V,g)
Cb=[1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1;1];
Cl=[0; 0;0; 0;0;0;0;0;0;0;0;0;0;0;0;0];
Au=[1 0;0 1;-1 0;0 -1];
bu=[5;5;5;5];
for i=1:size(V,2)
%for i=1:1
    if i~=g
        n=size(V(i).Ah,1);
        Wb=ones(n,1);
        if ~isempty(V(i).z)
            K1 = optFirstorderNOTvectorized(Wb,1,Cb(i),Cl(i),V(i).z,V(i).Ah,Au,V(i).Ax,V(i).Bx,V(i).bh,bu,y);
            %         K1=optFirstorder(Wb,1,1,1,[2;-2],V(i).Ah,Au,V(i).Ax,V(i).Bx,V(i).bh,bu,y);
            V(i).k=K1;
        else
            V(i).k=[];
        end
    end
end
end