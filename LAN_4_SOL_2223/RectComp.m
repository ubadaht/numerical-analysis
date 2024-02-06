function In=RectComp(funz,a,b,N)
%funz: integrand function
% a,b: integration interval
% N: number of subintervals in [a,b]
% N+1 nodes

h=(b-a)/N;
x = [a:h:b-h]; 
f = funz(x);
In=0;
for i=1:N
    In=In+f(i);
end
In=In*h;

%% In = h*sum(f(1:N)))

