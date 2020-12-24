function tree=RRTdata
tree(1).position=[2;3];
tree(1).next=2;
tree(1).neighbor=2;


tree(2).position=[4;5];
tree(2).next=3;
tree(2).neighbor=[1 3];

tree(3).position=[6;2];
tree(3).next=4;
tree(3).neighbor=[2 4];

tree(4).position=[8;7];
tree(4).next=7;
tree(4).neighbor=[3 5 6 7];

tree(5).position=[10;5];
tree(5).next=4;
tree(5).neighbor=4;

tree(7).position=[9;11];
tree(7).next=[];
tree(7).neighbor=4;

tree(6).position=[7;9];
tree(6).next=4;
tree(6).neighbor=4;
end