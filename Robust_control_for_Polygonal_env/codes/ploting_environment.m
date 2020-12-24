%plotting the environment and decompositions:

vertices=[10 40;10 80;30 70;60 70;85 40;85 20;90 5;65 5;75 20;75 40;60 50;30 50]';
figure(2)
set(gcf,'Renderer','Painters')
setFigFontSize(8)
polygon_plot(vertices,'b')
title('')
grid on 
axis([0 100 -2 84])
savefigure('env_comp','epsc',[4 3])

v(1).data=[10.5 40;30.5 50;30 70;10 80;]';
v(2).data=[30.5 50;60.5 50;60 70;30 70]';
v(3).data=[60.5 50;75 40;85 40;60 70]';
v(4).data=[75.5 20;85.5 20;85 40;75 40]';
v(5).data=[80 10;75.5 20;65 5]';
v(6).data=[80 10;85.5 20;75.5 20]';
v(7).data=[80 10;90 5;85.5 20]';
v(8).data=[80 10;65 5;90 5]';
figure(3)
set(gcf,'Renderer','Painters')
setFigFontSize(8)
for i=1:size(v,2)
    polygon_plot(v(i).data,'b')
    hold on
end
title('')
grid on 
axis([0 100 -2 84])
plot(10,40,'r*')
hold on

% savefigure('env_comp','epsc',[4 3])