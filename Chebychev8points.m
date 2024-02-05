clear all; clc; close all;
% Number of Chebyshev nodes
n_points = 8;

% Interval [a, b]
a = 0;
b = 2*pi;
f = @(x) sin(x).^2;

equally_spaced_points = linspace(a, b, n_points);
f_equally_spaced = f(equally_spaced_points);

% Chebyshev nodes
chebyshev_nodes = (a + b)/2 - (b - a)/2 * cos((2*(0:n_points-1) + 1) * pi / (2 * (n_points)));
f_chebyshev_nodes = f(chebyshev_nodes);

% Display the results
disp('Equally-Spaced Points:');
disp([equally_spaced_points' f_equally_spaced']);

disp('Chebyshev Nodes:');
disp([chebyshev_nodes' f_chebyshev_nodes']);

subplot(2, 1, 1);
plot(equally_spaced_points, f_equally_spaced, 'o', 'LineWidth', 2);
title('Function Evaluation at Equally-Spaced Points');
xlabel('x');
ylabel('f(x)');
grid on;

subplot(2, 1, 2);
plot(chebyshev_nodes, f_chebyshev_nodes, 'o', 'LineWidth', 2);
title('Function Evaluation at Chebyshev Nodes');
xlabel('x');
ylabel('f(x)');
grid on;