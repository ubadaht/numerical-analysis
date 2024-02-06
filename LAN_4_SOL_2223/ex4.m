clear all
clc

toll=1e-4;

n=1; % number of subintervals
pigreco_R = RectComp(@fun4,0,1,n);
while abs(pi-pigreco_R)/pi>toll
    n=n+1;
    pigreco_R=RectComp(@fun4,0,1,n);
end
fprintf('\n Composite rectangle rule, number of intervals %d',n)

n=1; % number of subintervals
pigreco_T = TrapComp(@fun4,0,1,n);
while abs(pi-pigreco_T)/pi>toll
    n=n+1;
    pigreco_T = TrapComp(@fun4,0,1,n);
end
fprintf('\n Composite Trapezoidal rule, number of intervals %d',n)

n=2; % number of points
x=[0,1];
y=fun4(x);
pigreco_Tp = trapz(x,y);
while abs(pi-pigreco_Tp)/pi>toll
    n=n+1;
    x=linspace(0,1,n);
    y=fun4(x);
    pigreco_Tp = trapz(x,y);
end
fprintf('\n Composite trapezoid method, number of intervals %d \n',n)

