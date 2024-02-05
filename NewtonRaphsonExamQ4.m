clear all; clc; close all;

maxItr = 100;
X = [1; 1];
tol= 1e-6;
for i = 1:maxItr
    F = sys(X(1),X(2));
    J = jaco(X(1),X(2));

    X = X- J\F;

    if max(abs(F))<tol
        fprintf('convergeance at iteration %d\n',i);
        break
    end
end

 fprintf('X = %f, Y = %f\n', X(1), X(2));

function F = sys(x,y)
    F = [x^2 + y^2 - 1;
        sin(pi*x/2) + y^3];
end

function J = jaco(x,y)
    J = [2*x, 2*y;
        pi/2 * cos(pi*x/2), 3*y^2];
end