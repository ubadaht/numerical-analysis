  function pval = HornerN(c,x,z)
%
% Pre:
%    c:   a vector.
%    x:   a vector with at least length(c)-1 components
%    z:   a vector.
%
% Post:
% pval:   a vector the same size as z with the property that if
%         p(x) = c(1) +  c(2)(x-x(1))+ ... + c(n)(x-x(1))...(x-x(n-1))
%         then pval(i) = p(z(i)) for i=1:m.
% 

  n = length(c); 
  pval = c(n)*ones(size(z));
  for k=n-1:-1:1
     pval = (z-x(k)).*pval + c(k);
  end