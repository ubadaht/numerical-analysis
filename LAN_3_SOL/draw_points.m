% DRAW: stores the coordinates of points data interactively with the key
% left mouse, ending when pressing the right button;
% the first and last data points, as they represent the departure
% and destination, are highlighted with a square
function p=draw_points()
j=0;
Npti =6;
p=zeros(2,Npti);
while(j<Npti)
    j=j+1;
    [x_m,y_m,button]=ginput(1);
    if (button==3)
        plot(p(1,j-1),p(2,j-1),'rs');
        return;
    end
    if (j==1)
        plot(x_m,y_m,'rs');
    end
    plot(x_m,y_m,'r.');
    p(:,j)=[x_m,y_m]';
end
