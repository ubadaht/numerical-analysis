clear all; clc; close all;

% Define the function
f = @(x) 25*x^3 - 6*x^2 + 7*x - 88;
% Point of interest
x = 2;

% Initialize values
h_values = 2.^(-32:-1);
results_table_backward = zeros(length(h_values), 2);
results_table_forward = zeros(length(h_values), 2);
results_table_central = zeros(length(h_values), 2);

% Calculate and store results for varying step sizes
for i = 1:length(h_values)
    h = h_values(i);

    % Approximations using different schemes
    backward_diff = (f(x) - f(x - h)) / h;
    forward_diff = (f(x + h) - f(x)) / h;
    central_diff = (f(x + h) - f(x - h)) / (2 * h);

    % Exact derivative at the specific step size
    exact_derivative = 75*x^2 - 12*x + 7;

    % Compute relative errors for different schemes
    err_backward = abs(backward_diff - exact_derivative) / abs(exact_derivative);
    err_forward = abs(forward_diff - exact_derivative) / abs(exact_derivative);
    err_central = abs(central_diff - exact_derivative) / abs(exact_derivative);

    % Store results in the tables
    results_table_backward(i, :) = [h, err_backward];
    results_table_forward(i, :) = [h, err_forward];
    results_table_central(i, :) = [h, err_central];
end

% Display the tables
disp('Results Table (Backward Difference):');
disp(array2table(results_table_backward, 'VariableNames', {'h', 'RelativeError'}));

disp('Results Table (Forward Difference):');
disp(array2table(results_table_forward, 'VariableNames', {'h', 'RelativeError'}));

disp('Results Table (Central Difference):');
disp(array2table(results_table_central, 'VariableNames', {'h', 'RelativeError'}));

% Visualize the tables of results (h, err)
figure;
plot(results_table_backward(:, 1), results_table_backward(:, 2), 'o-', 'LineWidth', 2, 'DisplayName', 'Backward Difference');
hold on;
plot(results_table_forward(:, 1), results_table_forward(:, 2), 's-', 'LineWidth', 2, 'DisplayName', 'Forward Difference');
plot(results_table_central(:, 1), results_table_central(:, 2), '^-', 'LineWidth', 2, 'DisplayName', 'Central Difference');
title('Relative Errors vs Step Size');
xlabel('Step Size (h)');
ylabel('Relative Error');
grid on;
legend('Location', 'Best');
hold off;
