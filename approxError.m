clear all;close all; clc;
% Calculate the values of f(n) and the error for different values of n
k_values = 0:2:16;
n_values = 10.^k_values;

% True value of e
true_e = exp(1);

% Initialize arrays to store results
f_n_values = zeros(size(n_values));
error_values = zeros(size(n_values));

% Calculate f(n) and error for each n
for i = 1:length(n_values)
    n = n_values(i);
    f_n_values(i) = (1 + 1/n)^n;
    error_values(i) = abs(true_e - f_n_values(i));
end

% Display the results
table_result = table(n_values', f_n_values', error_values', 'VariableNames', {'n', 'f(n)', 'Error'});
disp(table_result);

% Plot the results
figure;
semilogx(n_values, error_values, 'o', 'LineWidth', 2);
title('Approximation Error vs n');
xlabel('n');
ylabel('Approximation Error');
grid on;

% Comment: As n increases, the values of f(n) approach the true value of e,
% and the approximation error decreases. The plot visually shows the convergence
% of the approximation to the true value of e as n increases.
%However, due to limited precision of floating-point representation,
%which can introduce rounding errors,
% the error starts increasing, for very large values of n.
