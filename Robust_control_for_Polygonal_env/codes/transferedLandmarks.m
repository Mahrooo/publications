function yt=transferedLandmarks(y,t)

% a=[5 0;0 3];
% b=[1;2]*ones(1,4);
% yt=(a*y+b);

R=[cosd(t) -sind(t);sind(t) cosd(t)];
yt=R*y;
end