clear all;
clc; close all;

% Initial guesses
x0 = 1.5;
y0 = 3.5;

% Initial values
X = [x0; y0];

% Set tolerance
tol = 1e-6;

% Maximum number of iterations
max_iter = 100;

% Newton-Raphson iteration
for i = 1:max_iter
    % Evaluate the system of equations and Jacobian at the current values
    F = systemEquations(X(1), X(2));
    J = jacobianMatrix(X(1), X(2));
    
    % Update the values using the Newton-Raphson formula
    X = X - inv(J) * F;
    
    % Check for convergence
    if max(abs(F)) < tol
        fprintf('Converged in %d iterations\n', i);
        break;
    end
end

fprintf('Final solution:\n');
fprintf('x = %f\n', X(1));
fprintf('y = %f\n', X(2));

function F = systemEquations(x, y)
    % Define the system of equations
    F = [x^2 + x*y - 10;
         y + 3*x*y^2 - 57];
end
function J = jacobianMatrix(x, y)
    % Define the Jacobian matrix
    J = [2*x + y, x;
         3*y^2, 1 + 6*x*y];
end
