%data for control problem:
function [n,Ah,bh,y,Cl,Cb,Wl,Wb,Au,bu,Ax,bx]=data
n=[-1;0];

Ah=[-0.5 1;-0.5 -1;80 1];
bh=[-34.75;85;-880];

Ax=[0.5 -1;-40 -1;0.5 1;-80 -1];
bx=[-34.75;-1270;85;-880];

y=[10.5 40;30.5 50;30 70;10 80;]';

Cl=1;
Cb=1;
Wl=1;
Wb=[1;1;1];
Au=[1 0;0 1;-1 0;0 -1];
bu=[1;1;1;1];

Ax=[0.999999999999999,1;-1.000000000000000,-1;3.187672642712103,-1;1.000000000000000,1;-0.313708498984760,1];
bx=[6.999999999999998;-3.585786437626905;10.711822293899528;8.999999999999998;4.674098192195483];
Ah=-Ax;
bh=bx;
Ah(1,:)=[];
bh(1,:)=[];
n=[-1;-1];
y=[-0.828427124746190,3.414213562373095,4.707106781186548,3.292893218813453;4.414213562373095,0.171572875253809,4.292893218813451,5.707106781186546];
Wb=[1;1;1];
end



