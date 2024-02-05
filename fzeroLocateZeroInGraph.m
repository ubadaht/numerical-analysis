clear all; clc; close all;
% Define the function
fa = @(x) sin(10*x) + cos(3*x);

% Define the interval [a, b]
a = 3;
b = 5;

% Plot the function
x_vals = linspace(a, b, 1000);
figure;
plot(x_vals, fa(x_vals), 'LineWidth', 2);
title('Plot of f(x) = sin(10x) + cos(3x)');
xlabel('x');
ylabel('f(x)');
grid on;

% Determine and visualize zeros using fzero
initial_values = [3.5, 4, 4.5];
zeros_found = zeros(size(initial_values));

hold on;

for i = 1:length(initial_values)
    x0 = initial_values(i);
    
    % Use fzero to find the zero
    zero_found = fzero(fa, x0);
    zeros_found(i) = zero_found;
    
    % Plot the zero intersection
    plot(zero_found, 0, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
end

hold off;

% Display the zeros found
disp('Zeros found using fzero:');
disp(zeros_found);
