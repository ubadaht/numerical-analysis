% Script that calculates and displays the interpolation polynomial
% of a set of points read from file by:
% 
% 1. a single polynomial in Newton's form
% 2. a polynomial with cubic poly pieces (cubic splines).

% Read data
A=load('dataset1.dat');
[n m]=size(A);
x=A(1:n,1)';
y=A(1:n,2)';
a=min(x);
b=max(x);
n=length(x)-1  % Degree of the interpolant poly

% visualization points 
x1=[a:.01:b];
% Newton's interpolant
c=InterpN(x,y);
yInt=HornerN(c,x,x1); % evaluate the poly
% Spline Interpolant
yInt1=spline(x,y,x1);

% Visualize poly and spline interpolants
subplot(2,1,1)
plot(x1,yInt,x,y,'ro')
legend('Interp. Newton','(x_i,y_i)')
subplot(2,1,2)
plot(x1,yInt1,x,y,'ro')
legend('Interp. spline','(x_i,y_i)')
