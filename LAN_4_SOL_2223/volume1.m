clear all
clc

s=input('DATA SET:\n 1)assigned \n 2) in input\n ');
switch s
case 1
    a=0;
    b=6;    
    x=a:b;
    y=[6 5.6 4 4.4 5.2 7.8 8.5];
case 2
    num=input('how many points in input? ');
    figure
    grid on
    axis([0 8 0 8]);
    [x,y]=ginput(num);
    hold on
    a=min(x);
    b=max(x);
end

VV = pi* trapz(x,y.^2)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=input('Number of subintervals for the composite quadrature rule: ');
% compute the profile curve with spline interpolant
nodi  = linspace(a,b,n+1);
ftrap = spline(x,y,nodi);
% Compute the volume obtained by revolution 
f=ftrap.^2;

I=trapz(nodi,f);  % trapezoidal rule (points as input)
%I=SimpComp_Punti(nodi,f,a,b);

V=pi*I
fprintf('The volume of the solid is %f', V);

% Draw the spline interpolant 
xval=[a:0.1:b];
fval=spline(x,y,xval);
plot(x,y,'bo',xval,fval,'g')
