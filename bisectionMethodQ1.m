clear all; clc; close all;

f = @(x) (x-cos(x));
a= -10;
b= 10;

% Specify the tolerance
tolerance = 1e-6;

% Call the bisec function to find the root
[root_bisec, count_bisec] = bisec(f, a, b, tolerance);

% Display the results
fprintf('Bisection Method:\n');
fprintf('Root: %f\n', root_bisec);
fprintf('Number of Iterations: %d\n', count_bisec);

% Compare with the exact root
exact_root = 0.739085;
abs_error_bisec = abs(exact_root - root_bisec);
rel_error_bisec = abs(exact_root - root_bisec)/abs(exact_root) *100;
fprintf('Absolute Error: %e\n', abs_error_bisec);
disp('relative error:');
disp(rel_error_bisec);

function [root, count] = bisec(f, a, b, tol)
    count = 0;
    fa = f(a);
    fb = f(b);

    % Check if the initial condition satisfies f(a)f(b) < 0
    if fa * fb > 0
        disp('Initial condition does not satisfy f(a)f(b) < 0');
        return;
    end

    % Bisection method loop
    while abs(b - a) > tol
        mid = (a + b) / 2;
        fmid = f(mid);

        % Update the interval [a, b] based on the sign change
        if fa * fmid < 0
            fb = fmid;
            b = mid;
        else
            a = mid;
            fa = fmid;
        end

        % Increment the iteration count
        count = count + 1;
    end

    % Compute the root as the midpoint of the final interval
    root = (a + b) / 2;
end
