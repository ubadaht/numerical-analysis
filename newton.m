function [x,cont]= newton(fun,jac,x0,ep)
%
% Function for nonlinear system resolution f(x) = 0
% by Newton's method.
%
% INPUT:
% fun, jac  filenames containing respectively
%           the nonlinear function and the Jacobian matrix of the function
% x0        vector containing the initial approximation of the solution
% ep        fault tolerance parameter
% OUTPUT:
% x         solution vector of the nonlinear system (or equation)
% cont      number of iterations made to obtain the approximation
%           desired
%

y=feval(jac,x0)\feval(fun,x0);
x=x0-y;
cont=1;
while (norm(x-x0,'inf') > ep) & (cont<100)
   x0=x;
   y=feval(jac,x0)\feval(fun,x0); %sistema lineare
   x = x0 - y;
   cont=cont+1;
end
if cont==100
   disp('The procedure does not converge ');
   disp('under the given tolerance');
   disp('after 100 steps'); 
   fprintf('\t\t norm = %f .',norm(x-x0,'inf'));
end