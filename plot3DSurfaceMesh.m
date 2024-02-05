clear all; clc; close all;
% Script plot_3D
% Define the function
f = @(X, Y) sin(sqrt(X.^2 + Y.^2));

x = -15:0.5:15; %method 1 for domain
y=x;
[X,Y] = meshgrid(x,y);
%method 2 for domain
% [X, Y] = meshgrid(-15:0.5:15, -15:0.5:15);

% Evaluate the function on the grid
Z = f(X, Y);

% Plot the 3D surface
figure
mesh(Z)
figure;
surf(X, Y, Z, 'EdgeColor', 'none');
title('3D Plot of Z = sin(\surd(X^2 + Y^2))');
xlabel('X');
ylabel('Y');
zlabel('Z');
grid on;
