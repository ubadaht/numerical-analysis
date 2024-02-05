clear all; clc, close all

% Piecewise function

% Generate a table of v versus t for t= -5 to 50 at increments of 0.5
t_values = -5:0.5:50;
v_values = arrayfun(@rocket_velocity, t_values);

% Display the table
table_result = table(t_values', v_values', 'VariableNames', {'t', 'v'});
disp(table_result);


function v = rocket_velocity(t)
    if t >= 0 && t <= 10
        v = 11 * t.^2 - 5 * t;
    elseif t > 10 && t <= 20
        v = 1100 - 5 * t;
    elseif t > 20 && t <= 30
        v = 50 * t + 2 * (t - 20).^2;
    elseif t > 30
        v = 1520 * exp(-0.2 * (t - 30));
    else
        v = 0;
    end
end