clear all
clc

t=0:0.01:4;
%t=linspace(0,4,100);
x = 1-(t-2).^2;
y = (t-2).*(1-(t-2).^2);
% visualize the entire trajectory
plot(x,y,'b-');
hold on

% visualize the two trajectories
t1=0:0.01:1.5;
x1=1-(t1-2).^2;
y1=(t1-2).*(1-(t1-2).^2);
plot(x1,y1,'ro');

t2=2:0.01:3.5;
x2=1-(t2-2).^2;
y2=(t2-2).*(1-(t2-2).^2);
plot(x2,y2,'go');

legend('trajectory', 'firt', 'second');

%compute the space between the two time intervals 
disp('The space covered in the first time interval is:');
I1 = quad(@func_length,0,1.5)
disp('The space covered in the second time interval is:');
I2 = quad(@func_length,2,3.5)