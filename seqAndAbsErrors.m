% Initialize variables
n_max = 30;
z = zeros(n_max, 1);
relative_error = zeros(n_max, 1);

% Initial value
z(1) = 2;

% Compute the sequence and relative error
for n = 2:n_max
    z(n) = 2^((n-1)/2) * sqrt(1 - sqrt(1 - 4^(1-n) * z(n-1)^2));
    relative_error(n) = abs(pi - z(n)) / abs(pi);
end

% Plot the relative error versus n
figure;
plot(1:n_max, relative_error, '-o');
title('Relative Error vs. n');
xlabel('n');
ylabel('Relative Error');
