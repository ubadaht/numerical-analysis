clear all; clc; close all;
%interval [a, b] containing one of its roots
a = -2;
b = 2;

%fa = @(x) (exp(x) - 2*x.^2); %alternate method to define function
% Generate x values for plotting
x_values = linspace(a, b, 1000);

% Evaluate the function at x_values
y_values = fa(x_values);

% Plot the function
figure;
plot(x_values, y_values, 'LineWidth', 2);
title('Plot of f(x) = e^x - 2x^2');
xlabel('x');
ylabel('f(x)');
grid on;

function y = fa(x)
    % Implementation of the function f(x) = e^x - 2x^2
    y = exp(x) - 2 * x.^2;
end
