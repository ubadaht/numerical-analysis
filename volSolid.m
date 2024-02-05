% exe3.m

% Define the function profile f(z) = sin(z) + z^2
funz = @(z) sin(z) + z.^2;

% Integration limits
a = 0;
b = 1;

% Calculate the volume using quad()
V = pi * quad(@(z) (funz(z)).^2, a, b);

% Display the calculated volume
fprintf('Volume of the solid of revolution: %f\n', V);

% Script sweep.m for visualization
% ... (unchanged from your provided script)
N = 50; % number of points along the profile
z = linspace(0, 1, N)';
radius = funz(z); % memorize the function profile in funz.m
theta = 2*pi*linspace(0, 1, N);
X = radius.*cos(theta);
Y = radius.*sin(theta);
Z = z(:, ones(1,N));
surf(X,Y,Z)
axis equal
