clear all; clc;
% Number of Chebyshev nodes
n = 21;

% Interval [a, b]
a = -1;
b = 1;

f = @(x) sin(2 * pi * x);
% Calculate Chebyshev nodes using the given formula
cheb_nodes = (a + b)/2 - (b - a)/2 * cos(pi * (1:n)/ n);

% Evaluate the function at Chebyshev nodes
f_values = f(cheb_nodes);

% Display the results
disp('Chebyshev Nodes:');
disp(cheb_nodes);
disp('Function Values at Chebyshev Nodes:');
disp(f_values);

figure;
scatter(cheb_nodes, f_values, 'o', 'blue');
title('Values of f(x) at Chebyshev Nodes');
xlabel('x');
ylabel('f(x) at Chebyshev Nodes');