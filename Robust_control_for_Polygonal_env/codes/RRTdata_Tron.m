function tree=RRTdata_Tron
tree(1).position=[0;20];
tree(1).next=2;
tree(1).neighbor=2;


tree(2).position=[4;19];
tree(2).next=3;
tree(2).neighbor=[1 3];


tree(3).position=[8;16];
tree(3).next=4;
tree(3).neighbor=[2 4];

tree(4).position=[9;10];
tree(4).next=5;
tree(4).neighbor=[3 5];

tree(5).position=[14;1];
tree(5).next=[];
tree(5).neighbor=[4  ];

tree(6).position=[10;27];
tree(6).next=7;
tree(6).neighbor=7;

tree(7).position=[13;24];
tree(7).next=8;
tree(7).neighbor=[6 8];

tree(8).position=[15;17];
tree(8).next=9;
tree(8).neighbor=[9;7];

tree(9).position=[15.5;12];
tree(9).next=10;
tree(9).neighbor=[10 8];

tree(10).position=[19;11];
tree(10).next=11;
tree(10).neighbor=[11 9];

tree(11).position=[20;9];
tree(11).next=5;
tree(11).neighbor=[5 10 12];

tree(12).position=[23;12];
tree(12).next=11;
tree(12).neighbor=[11 13];

tree(13).position=[25;16];
tree(13).next=12;
tree(13).neighbor=[12 14];

tree(14).position=[27;22];
tree(14).next=13;
tree(14).neighbor=[13 15 16];

tree(15).position=[21;19];
tree(15).next=14;
tree(15).neighbor=14;

tree(16).position=[22;27];
tree(16).next=14;
tree(16).neighbor=14;
end