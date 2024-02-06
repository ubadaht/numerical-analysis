clear all
clc
close all

figure(1)
[x,y]=ginput()
plot(x,y,'ro')
n =length(x);
L1=0.5;
L2=0.5;

R2=x.^2+y.^2;
theta2=acos((R2-L1^2-L2^2)/(2*L1*L2));
beta=acos((R2+L1^2-L2^2)./(2*L1*sqrt(R2)));
alpha=atan(y./x);
for i=1:length(theta2)
    if theta2(i)<0
        theta1(i)=alpha(i)+beta(i);
    else 
        theta1(i)=alpha(i)-beta(i);
    end
end

t=linspace(0,1,n);
tt=linspace(0,1,50);
t1=spline(t,theta1,tt);
t2=spline(t,theta2,tt);

xx=L1*cos(t1)+L2*cos(t1+t2);
yy=L1*sin(t1)+L2*sin(t1+t2);

hold on
plot(xx,yy) % plot the robot path
hold off

dati=[theta1',theta2]
save motors.dat dati -ascii