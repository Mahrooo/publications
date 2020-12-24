function [MarkLocation, A_h, A_b, z_h, z_b, p_r] = GenerateEnv(plotFlag)
%% This file generate landmarks and convex cell including the end face
% plotFlag (default true) control plotting 
if (nargin < 1)
    plotFlag = true;
end
%% Generate landmarks
rng(1234)
N_L = 4; % number of landmarks
MarkLocation = rand(N_L, 2)*100;

%% Generate convex cell
WallLocation = [65,40; 30,30; 20,70; 60,50]; % four point for the wall corner
N_H = length(WallLocation);
P_mid = mean(WallLocation);
A_h = [];   % wall
A_b = [];
for i=1:N_H-1
    p1 = WallLocation(i,:);
    p2 = WallLocation(i+1, :);
    y2_y1 = p2(2) - p1(2);
    x2_x1 = p2(1) - p1(1);
    a = [y2_y1, -x2_x1];
    b = x2_x1*p1(2) - y2_y1*p1(1);
    s = sign(a*P_mid'+b);
    A_h = [A_h; a*s];
    A_b = [A_b; b*s];
end
%% The end face
p1 = WallLocation(1,:);
p2 = WallLocation(4, :);
y2_y1 = p2(2) - p1(2);
x2_x1 = p2(1) - p1(1);
a = [y2_y1, -x2_x1];
b = x2_x1*p1(2) - y2_y1*p1(1);
s = sign(a*P_mid'+b);
z_h = a*s;
z_b = b*s;
p_r = (p1+p2)/2;

%% plot the result
if plotFlag
    figure
    axis([0, 100, 0, 100])
    hold on
    landmark = plot(MarkLocation(:,1),MarkLocation(:,2), 'd');  % plot landmark
    corner = plot(WallLocation(:,1),WallLocation(:,2), '^');  % plot wall corner
    for i=1:N_H-1   
        p1 = WallLocation(i,:);
        p2 = WallLocation(i+1, :);
        x = min(p1(1), p2(1)):max(p1(1), p2(1));
        y = -1/A_h(i,2)*(A_h(i,1)*x+A_b(i));
        wall = plot(x, y, 'b');     % plot convex wall
    end

    p1 = WallLocation(1,:);
    p2 = WallLocation(4, :);
    x = min(p1(1), p2(1)):max(p1(1), p2(1));
    y = -1/z_h(2)*(z_h(1)*x+z_b);
    endface = plot(x, y, 'r');     % plot end face
    legend([landmark, corner, wall, endface],'landmark','wall corner','wall','end face', 'Location', 'SouthEast', 'AutoUpdate','off') 
end
end
