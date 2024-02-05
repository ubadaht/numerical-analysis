clear all; clc;

X = [1; 1];
tol = 1e-5;
maxItr = 100;

for i = 1:maxItr
    f = equations(X(1), X(2));
    j = jacob(X(1), X(2));
    X = X - j\f;
    if max(abs(f)) < tol
        fprintf('Converged in %d iterations\n', i);
        break;
    end
end

fprintf('X = %f, Y = %f\n', X(1), X(2));

function f = equations(x, y)
    f = [x^2 + y^2 + 1;
         sin(pi*x/2) + y^3];
end

function j = jacob(x, y)
    j = [2*x, 2*y;
         pi/2*cos(pi*x/2), 3*y^2];
end
