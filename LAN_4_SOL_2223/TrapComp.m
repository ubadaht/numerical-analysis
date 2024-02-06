function In=TrapComp(funz,a,b,N)
%funz: integrand function
% a,b: integration interval
% N: number of subintervals in [a,b]
% N+1 nodes

h=(b-a)/N;
x=[a:h:b];
f=funz(x);

In=f(1)+f(N+1);
for i=2:N
    In=In+2*f(i);
end
In=In*h/2;

%% In = f(1)+f(N+1)+2*sum([f(2:N)]);
