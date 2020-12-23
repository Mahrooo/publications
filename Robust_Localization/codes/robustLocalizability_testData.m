function [E,Ti_truth]=robustLocalizability_testData(test_name)
switch test_name
    case '6 nodes'
        E=[1 2;2 3;3 4;4 5;5 6;6 1;1 3;1 5;4 1;2 6;5 2;3 5];
        E=[1 2;1 3;1 4;1 5;1 6;2 3;2 4;2 5;2 6;3 4;3 5;3 6;4 5;4 6;5 6];
        Ti_truth=[0 3 7 10 6 2;0 3 5 -1 -6 -4];

    case '5 nodes'
        E=[1 2;1 3;1 4;1 5;2 3;2 4;2 5;3 4;3 5;4 5];
%         E=[1 2;1 3;1 4;1 5;2 3;2 4;2 5;3 4;3 5;4 5];
         E=transpose(flip(transpose(E)));
        Ti_truth=[0 10 10 0 15;0 0 15 15 10];
    case '3 nodes'
        E=[1 2;3 1;3 2];
        Ti_truth=[0 0 0;0 0 0];
    case '4 nodes'
        E=[1 2;2 3;3 4;4 1;1 3;4 2];
        Ti_truth=[0 10 10 0;0 0 10 10];
        
    case '7 nodes'
        E=[1 2;1 3;1 4;1 5;1 6;1 7;2 3;2 4;2 5;2 6;2 7;3 4;3 5;3 6;3 7;4 5;4 6;4 7;5 6;5 7;6 7];
        Ti_truth=[0 3 7 10 6 2 10;0 3 5 -1 -6 -4 -10];
        
    case '8 nodes'
        E=[1 2;1 3;1 4;1 5;1 6;1 7;1 8;2 3;2 4;2 5;2 6;2 7;2 8;3 4;3 5;3 6;3 7;3 8;4 5;4 6;4 7;4 8;5 6;5 7;5 8;6 7;6 8;7 8];
        Ti_truth=[0 3 7 10 6 2 10 15;0 3 5 -1 -6 -4 -10 -15];
end



%%% rabdimly generate a graph:
% G=graph_generator(E);
% E=table2array(G.Edges);
% E(:,3)=[];

% %random:
% Ti_truth=[0 -20;5 -17;10 -12;15 -7;20 0;15 8; 10 13;5 18;0 20;-5 16;-10 10;-15 6;-20 0;-15 -6;-10 -11;-5 -18]';
% E=[1 2;2 3;3 4;4 5;5 6;6 7;7 8;8 9;9 10;10 11;11 12;12 13;13 14;14 15;15 16;16 1];
% nNodes=size(Ti_truth,2);
% Prob_Zeros_Incidence_matrix=0.6;
% Graph=random_graph(nNodes,Prob_Zeros_Incidence_matrix);
% d=degree(Graph);
% E=table2array(Graph.Edges);
% E(:,3)=[];

