N=80;         % number of profile points
z=linspace(-5,5,N)';
radius=funz(z); %sqrt(1+z.^2);  % profile function
theta=2*pi*linspace(0,1,N);
X=radius*cos(theta);
Y=radius*sin(theta);
Z=z(:,ones(1,N));
surf(X,Y,Z)
axis equal