clear all; clc; close all;

% Define the parametric curve function F(t) = (x(t), y(t))
Fx = @(t) (6*t - 9*t^2 + 4*t^3);
Fy = @(t) (-3*t^2 +4*t^3);

% Time interval
t_values = linspace(0, 1, 100);
for i = 1:100
    t =t_values(i);
    plot(Fx(t),Fy(t),'ro', 'MarkerSize',10)
    drawnow
    pause(0.01)
end
% Set the title and labels
title('Trajectory of Parametric Curve');
xlabel('x');
ylabel('y');
grid on;
