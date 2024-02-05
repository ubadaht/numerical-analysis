clear all; clc;

%initial condition
x0= 1.2;
y0 = 1.2;
X = [x0; y0];

tol = 1e-6;
max_iterations = 100;

for i = 1:max_iterations
    F =nonlinearSystem(X(1),X(2));
    J = jacobianSystem(X(1),X(2));
    X = X- inv(J) *F;
    if max(abs(F))< tol
        fprintf('System Converged in %d iterations\n', i);
        break
    end

end
fprintf('Final Values: X = %f, Y = %f\n', X(1), X(2))

function F = nonlinearSystem(x, y)
    F = [-x^2 + x + 0.75 - y;
         y + 5*x*y - x^2];
end

function J = jacobianSystem(x,y)
    J = [-2*x + 1, -1;
         -2*x + 5*y, 1 + 5*x];
end
