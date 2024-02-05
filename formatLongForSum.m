%sun using for cycle in format long
% Initialize sum
clear all; clc; close all;
total_sum = 0;

% for loop to sum 0.1 one hundred times
for i = 1:100
    total_sum = total_sum + 0.1;
end

% Displaying the result with extended precision
format long;
disp(total_sum);

% Comment: Due to the way floating-point numbers are represented in MATLAB,
% the result might not be exactly 10. The limited precision of floating-point
% representation can introduce small rounding errors during repeated addition.
