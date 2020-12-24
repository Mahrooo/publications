%% This file generate dynamic model
% x = [x y vx vy]
A = [0 0 1 0;
     0 0 0 1;
     0 0 0 0;
     0 0 0 0];
 
 B = [0 0;
      0 0;
      1 0;
      0 1];
 
%Y: vectorized of landmarks
%d:dimestion  

% % coordicate translate
% Ab = A_b + A_h*p_r';
% zb = z_b + z_h*p_r';

Ab = A_b;
zb = z_b;

Ah = [A_h, zeros(length(A_h),2)];   % A_h and A_b just contain the constraint for location, Ah is the entire form for CBF
zh = [z_h, zeros(1,2)];     %exit face

% Ah = [Ah; zh];
% Ab = [Ab; zb];

Ax = [-Ah; -zh];   %convex cell
bx = [Ab; zb];

Au = [1 0; 
      0 1;
      -1 0;
      0 -1];
bu = [1;1;1;1]*100;