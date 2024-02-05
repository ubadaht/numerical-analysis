clear all; clc; close all;
% Define the function
K = 0.05;
pt = 3;
f = @(x) K- x./(1 - x).*sqrt(2*pt./(2+x));

% Plot the function over a suitable interval
a = -1; % interval
b = 1; % interval
x_values = linspace(a, b, 10);
y_values = f(x_values);

figure;
plot(x_values, y_values, 'LineWidth', 2);
title('Plot of the Function');
xlabel('x');
ylabel('f(x)');
grid on;

[val, iteration] =secant_method(f,0,3,1e-8,100);
disp(val)
disp(iteration)

function [x, iter] = secant_method(f, x0, x1, TOL, max_iterations)
    iter = 0;
    while iter < max_iterations
        x = x1 - f(x1) * (x1 - x0) / (f(x1) - f(x0));
        if abs(x - x1) < TOL
            return;
        end
        x0 = x1;
        x1 = x;
        iter = iter + 1;
    end
    error('Secant method did not converge within the maximum number of iterations.');
end