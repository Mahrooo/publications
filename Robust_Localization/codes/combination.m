function cc=combination(N)
k=0;
for i=1:N
    C=combnk((1:N),i);
    for j=1:size(C,1)
        k=k+1;
        cc(k).c=C(j,:);
    end
end
end
