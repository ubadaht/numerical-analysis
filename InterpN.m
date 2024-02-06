  function c = InterpN(x,y)
%
% Pre:
%   x:  column n-vector with distinct components.
%   y:  column n-vector.
%
% Post:
%   c:  a column n-vector with the property that if
%       p(x) = c(1) + c(2)(x-x(1))+...+ c(n)(x-x(1))...(x-x(n-1))
%       p(x(i)) = y(i), i=1:n.
%
%
   n = length(x);
   for k = 1:n-1
      y(k+1:n) = (y(k+1:n)-y(k)) ./ (x(k+1:n) - x(k)); 
   end
   c = y;