% Script that calculates and displays the interpolation polynomial
% of a set of points on a function, by:
%
% 1. a single polynomial in Newton's form
% 2. a polynomial with cubic poly pieces (cubic splines).


% Read as input the degree of the interpolating polynomial,
n=input('Degree of the interpolating poly ')
method=input('1) Equispaced points  2) Chebychev points')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CASE 1: interpolation points with equispaced abscissas
%           and y values given by the function evaluation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
a=-5; b=5;
switch method
case 1
    % equispaced interpolating points
    x=linspace(a,b,n+1);
case 2    
    % interpolating points as zeros of the Chebychev poly
    for i=1:n+1
        x(i)=(a+b)/2-(b-a)/2*cos(pi*(2*(i-1)+1)/(2*(n+1)));
    end
otherwise
    disp('Error')
end
y=funRunge(x);
figure(3)
% evaluation points 
x1=[a:.01:b]; 
yfun=funRunge(x1);
% Newton's interpolant
c = InterpN(x,y);
yInt = HornerN(c,x,x1); %evaluate the interpolant poly
% spline interpolant
yInt1 = spline(x,y,x1);
plot(x1,yInt1,x1,yInt,x,y,'ro',x1,yfun,'m')
title('Interpolation')
legend('Interp. spline','Interp. Newton','(x_i,y_i)','Func')

disp('Max error Interp.pol.')
%max(abs(yfun-yInt))
norm(yfun-yInt)

disp('Max error Interp.spline')
%max(abs(yfun-yInt1))
norm(yfun-yInt1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Run for the function
% y=1/(1+x^2)'
% by replacing  
%  fun1 [a,b]=[-pi,pi] with  funRunge [a,b]=[-5,5]
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%