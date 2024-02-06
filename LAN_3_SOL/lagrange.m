function [ yval ] = lagrange( x,y,xval )
% Lagrange: Lagrange interpolating polynomial
%   yval = Lagrange(x,y,xx): Uses an (n - 1)-order
%     Lagrange interpolating polynomial based on n data points
%     to determine the values of the dependent variable (yint) at
%     given values of the independent variable, xval.
% input:
%   x = independent variable
%   y = dependent variable
%   xval = values of independent variable at which the
%        interpolation is calculated
% output:
%   yval = interpolated value of dependent variable

n = length(x);
y_lagrange = 0;
  for i=1:n
    product = y(i);
    % compute basis function L_i(xval)
    for j=1:n
        if i~=j
            fact = (xval-x(j))./(x(i)-x(j));
            product = product.*fact;
        end
    end
    y_lagrange = y_lagrange + product;
  end
yval=y_lagrange;